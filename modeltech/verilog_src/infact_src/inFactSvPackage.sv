// inFactSvPackage.sv
// Copyright 2006-2020 Mentor Graphics Corporation. All Rights Reserved.

(* questa_bootstrap_so   = "$(INFACT_HOME)/$(PLATFORM)/questaBootLoader.so" *)
(* questa_bootstrap_init = "inFactQuestaBootLoaderInit" *)

package inFactSv;

  function string inFactSvPackageVersion();
    return "inFactSvPackage_001";
  endfunction
  export "DPI-C" function inFactSvPackageVersion;

  typedef enum { TestEngine_Started         =  1, 
		 TestEngine_Action_Before   =  2,
		 TestEngine_Action_After    =  4,
		 TestEngine_Completed       =  8, 
		 TestEngine_Restarted       = 16,
		 TestEngine_ReplayExhausted = 32
  } TestEngineCallbackReason;

  typedef enum { NotNode                      = 0, 
		 ActionNode                   = 1,
		 SignedMetaActionNode         = 2,
		 SignedMetaActionImportNode   = 3,
		 UnsignedMetaActionNode       = 4,
		 UnsignedMetaActionImportNode = 5 
  } TestEngineNodeType;

  typedef class TestEngine;
  virtual class TestEngineCallback;
    /* NYI local */ int _reasons;
    virtual function void trigger(TestEngine te, 
                                  TestEngineCallbackReason reason,
                                  TestEngineNodeType nodeType,
                                  longint unsigned value);
    endfunction: trigger
  endclass: TestEngineCallback

  import "DPI-C" context
    function chandle _inFact_createNewTestengine(input string testEngineName,
                                                 input string instanceName,
                                                 input string moduleName,
                                                 input int noTidFilesOk );
  import "DPI-C" context
    function chandle _inFact_createNewParameterizedTestengine(
                                                 input string testEngineName,
                                                 input string instanceName,
                                                 input string moduleName,
                                                 input int numberOfParameters,
                                                 input string parameters);

  import "DPI-C" function void _inFact_deleteTestEngine(input chandle me);
  import "DPI-C" function void _inFact_dump(input chandle me, input string teName);
  import "DPI-C" function void _inFact_dump_flat(input chandle me, input string teName);
  import "DPI-C" function string _inFact_name(input chandle me);
  import "DPI-C" function string _inFact_module_name(input chandle me);
  import "DPI-C" function string _inFact_instance_name(input chandle me);
//  import "DPI-C" _infact_load_aut_data=function chandle load_aut_data(input chandle hndl, input string data);
  import "DPI-C" context function chandle _infact_load_aut_data(input chandle hndl, input string data);
//  import "DPI-C" _infact_load_aut_data_done=function void load_aut_data_done(chandle hndl);
  import "DPI-C" context function void _infact_load_aut_data_done(input string teName, chandle hndl);
  import "DPI-C" 
    function void _inFact_force_next_action(input chandle me, input string actionName);
  import "DPI-C" 
    function void _inFact_skip_to_action(input chandle me, input string atcionName);
  import "DPI-C" 
    function void _inFact_set_tag_probability(input chandle me, 
                                              input string tagName,
                                              input real value);
  import "DPI-C" 
    function void _inFact_stop_loop_expansion_after(input chandle me,
                                                    input int count,
                                                    input int loopDepth);
  import "DPI-C" context function int _inFact_loop_depth(input chandle me);
  import "DPI-C" context task _inFact_runTestengine(input chandle me);
  import "DPI-C" context function void _inFact_runTestengineF(input chandle me);
  import "DPI-C" context function void _inFact_suspendTestengine(input chandle me);
  import "DPI-C" context function void _inFact_te_setCallback(input chandle me, int reason);
  import "DPI-C" context function void _inFact_te_unsetCallback(input chandle me);
  import "DPI-C" context function string _inFact_te_currentNodeName(input chandle _me);
`ifdef INCA
  import "DPI-C" context function
    void _inFact_te_remember(input chandle me, input int index);
  import "DPI-C" context function
    int _inFact_te_recall(input chandle me);
  import "DPI-C" context function
    void _inFact_te_forget(input chandle me);
`endif

  function chandle load_aut_data(input chandle hndl, input string data);
    return _infact_load_aut_data(hndl, data);
  endfunction

  function void load_aut_data_done(input string teName, input chandle hndl);
    _infact_load_aut_data_done(teName, hndl);
  endfunction

  class TestEngine;
    static TestEngine _te_map[string];
    /* NYI local */ chandle _me;
`ifndef INCA
    static TestEngine _map[chandle];
`else
    static TestEngine _map[int];
    static int nextIndex = 0;
`endif
    /* NYI local */ TestEngineCallback _callbacks[$];
    /* NYI local */ int _reasons;

    static function TestEngine findTestEngine(string instanceName, 
                                              string testEngineName);
      string key = {instanceName, ".", testEngineName};
      if (_te_map.exists(key)) return _te_map[key];
      else return null;
    endfunction

    static function int nTestEngines();
      return _te_map.num();
    endfunction

    static function TestEngine testEngine(int index);
      int i = 0;
      int numberOfTestEngines = nTestEngines();
      TestEngine te;
      string key;
      if (index >= numberOfTestEngines) return null;
      if (_te_map.first(key))
        do begin
          if (i == index) return _te_map[key];
          ++i;
        end while (_te_map.next(key));
    endfunction

    // constructor
    function new(string testEngineName, string instanceName, string moduleName,
                 bit isParameterized = 0, int numberOfParameters = 0, 
                 string parameters = "", bit noTidFilesOk = 0);
      if (0 == isParameterized) begin
        _me = _inFact_createNewTestengine(testEngineName, 
                                          instanceName,
                                          moduleName,
                                          noTidFilesOk);
      end else begin
        _me = _inFact_createNewParameterizedTestengine(testEngineName,
                                                       instanceName,
                                                       moduleName,
                                                       numberOfParameters,
                                                       parameters);
      end
      if (valid()) begin
        _te_map[{instanceName, ".", testEngineName}] = this;
`ifndef INCA
        _map[_me] = this;
`else
        _inFact_te_remember(_me, nextIndex);
        _map[nextIndex] = this;
        nextIndex = nextIndex + 1;
`endif
	_reasons = 0;
      end
    endfunction

    function bit valid();
      valid = (_me == null) ? 0 : 1;
    endfunction

    function void delete();
      _te_map.delete({instance_name(), ".", name()});
      _inFact_deleteTestEngine(_me);
`ifndef INCA
      _map[_me] = null;
`else
      _inFact_te_forget(_me);
`endif
      _me = null;
    endfunction

    // dump a hierarchical graph (in dot format) for the testengine
    function void dump(string fileName);
      _inFact_dump(_me, fileName);
    endfunction

    // dump a flat graph (in dot format) for the testengine
    function void dump_flat(string fileName);
      _inFact_dump_flat(_me, fileName);
    endfunction

    // name of test engine
    function string name();
      name = _inFact_name(_me);
    endfunction

    // name of test module
    function string module_name();
      module_name = _inFact_module_name(_me);
    endfunction

    // name of test module instance
    function string instance_name();
      instance_name = _inFact_instance_name(_me);
    endfunction

    // force next action
    function void force_next_action(string actionName);
      _inFact_force_next_action(_me, actionName);
    endfunction

    // skip to action
    function void skip_to_action(string actionName);
      _inFact_skip_to_action(_me, actionName);
    endfunction

    // set tag probability
    function void set_tag_probability(string tagName, real value);
      _inFact_set_tag_probability(_me, tagName, value);
    endfunction

    // stop loop expansion
    function void stop_loop_expansion_after(int count, int breakDepth);
      _inFact_stop_loop_expansion_after(_me, count, breakDepth);
    endfunction

    // loop depth
    function int loop_depth();
      return _inFact_loop_depth(_me);
    endfunction

    // run
    task run();
      _inFact_runTestengine(_me);
    endtask

    // run
    function void runF();
      _inFact_runTestengineF(_me);
    endfunction

    // suspend after current action
    function void suspend();
      _inFact_suspendTestengine(_me);
    endfunction

    function void setCallback(TestEngineCallback cb, int reasons);
      if ((~ _reasons) & reasons) begin
	if (_callbacks.size() > 0)
	  _inFact_te_unsetCallback(_me);
	_reasons |= reasons;
	_inFact_te_setCallback(_me, _reasons);
      end
      for (int i = 0; i < _callbacks.size(); i++)
	if (_callbacks[i] == cb) begin
	  cb._reasons |= reasons;
	  return;
	end
      cb._reasons = reasons;
      _callbacks.push_back(cb);
    endfunction

    function void unsetCallback(TestEngineCallback cb);
      for (int i = 0; i < _callbacks.size(); i++)
	if (_callbacks[i] == cb) begin
	  _callbacks.delete(i);
	  break;
	end
      if (_callbacks.size() == 0) begin
	_inFact_te_unsetCallback(_me);
	_reasons = 0;
      end
    endfunction

    function void triggerCallback(int reason, int nodeType,
                                  longint unsigned value);
      automatic TestEngineCallbackReason cbReason;
      automatic TestEngineNodeType cbNodeType;
      $cast(cbReason, reason);
      $cast(cbNodeType, nodeType);
      for (int i = 0; i < _callbacks.size(); i++)
	if (reason & _callbacks[i]._reasons)
	  _callbacks[i].trigger(this, cbReason, cbNodeType, value);
    endfunction

    function string currentNodeName();
      currentNodeName = _inFact_te_currentNodeName(_me);
    endfunction

  endclass: TestEngine

  function void testEngineCallback(input chandle me, input int reason, 
                                   input int nodeType, longint unsigned value);
`ifndef INCA
    if (TestEngine::_map[me] != null) begin
      TestEngine::_map[me].triggerCallback(reason, nodeType, value);
    end
`else
    int index;
    index = _inFact_te_recall(me);
    if (0 <= index) begin
      TestEngine::_map[index].triggerCallback(reason, nodeType, value);
    end
`endif
  endfunction
    // export testEngineCallback
  export "DPI-C" function testEngineCallback;

  import "DPI-C" context
    function void _inFact_registerActionTask(input chandle me, 
                                             input string actionName, 
                                             input int taskId);
  import "DPI-C" context
    function void _inFact_registerActionFunction(input chandle me,
                                                 input string actionName,
                                                 input int functionId);
  import "DPI-C" context
    function void _inFact_registerSignedMetaActionTask(
      input chandle me,
      input string metaActionName,
      input int taskId);
  import "DPI-C" context
    function void _inFact_registerSignedMetaActionFunction(
      input chandle me,
      input string metaActionName,
      input int functionId);
  import "DPI-C" context
    function void _inFact_registerUnsignedMetaActionTask(
      input chandle me,
      input string metaActionName,
      input int taskId);
  import "DPI-C" context
    function void _inFact_registerUnsignedMetaActionFunction(
      input chandle me,
      input string metaActionName,
      input int functionId);
  import "DPI-C" context
    function void _inFact_registerSignedMetaActionImportTask(
      input chandle me,
      input string metaActionName,
      input int functionId);
  import "DPI-C" context
    function void _inFact_registerSignedMetaActionImportFunction(
      input chandle me,
      input string metaActionName,
      input int functionId);
  import "DPI-C" context
    function void _inFact_registerUnsignedMetaActionImportTask(
      input chandle me,
      input string metaActionName,
      input int functionId);
  import "DPI-C" context
    function void _inFact_registerUnsignedMetaActionImportFunction(
      input chandle me,
      input string metaActionName,
      input int functionId);

  virtual class FunctorBase;

    static int _current_index = 0;
    static int _current_size = 0;
    static FunctorBase _array[];
    int _index;

    function new();
      if (_current_index == _current_size) begin
        _current_size = (0 == _current_size) ? 100 : _current_size * 2;
        _array = new[_current_size](_array);
      end
      _index = _current_index++;
      _array[_index] = this;
    endfunction: new

    function void register_actionTask(TestEngine te, string actionName);
      _inFact_registerActionTask(te._me, actionName, _index);
    endfunction: register_actionTask

    function void register_actionFunction(TestEngine te, string actionName);
      _inFact_registerActionFunction(te._me, actionName, _index);
    endfunction: register_actionFunction

    function void register_signedMetaActionTask(TestEngine te,
                                                string metaActionName);
      _inFact_registerSignedMetaActionTask(te._me, metaActionName, _index);
    endfunction: register_signedMetaActionTask

    function void register_signedMetaActionFunction(TestEngine te, 
                                                    string metaActionName);
      _inFact_registerSignedMetaActionFunction(te._me, metaActionName, _index);
    endfunction: register_signedMetaActionFunction

    function void register_unsignedMetaActionTask(TestEngine te,
                                                  string metaActionName);
      _inFact_registerUnsignedMetaActionTask(te._me, metaActionName, _index);
    endfunction: register_unsignedMetaActionTask

    function void register_unsignedMetaActionFunction(TestEngine te, 
                                                      string metaActionName);
      _inFact_registerUnsignedMetaActionFunction(te._me, metaActionName, _index);
    endfunction: register_unsignedMetaActionFunction

    function void register_signedMetaActionImportTask(TestEngine te, 
                                                      string metaActionName);
      _inFact_registerSignedMetaActionImportTask(te._me, metaActionName, _index);
    endfunction: register_signedMetaActionImportTask

    function void register_signedMetaActionImportFunction(TestEngine te, 
                                                          string metaActionName);
      _inFact_registerSignedMetaActionImportFunction(te._me, metaActionName,
                                                     _index);
    endfunction: register_signedMetaActionImportFunction

    function void register_unsignedMetaActionImportTask(TestEngine te, 
                                                        string metaActionName);
      _inFact_registerUnsignedMetaActionImportTask(te._me, metaActionName,
                                                   _index);
    endfunction: register_unsignedMetaActionImportTask

    function void register_unsignedMetaActionImportFunction(TestEngine te, 
                                                            string metaActionName);
      _inFact_registerUnsignedMetaActionImportFunction(te._me, metaActionName,
                                                       _index);
    endfunction: register_unsignedMetaActionImportFunction

    static function FunctorBase get(int index);
      get = _array[index];
    endfunction: get

    virtual function void actionFunction();
      //<tbd> error message
      $finish(1);
    endfunction: actionFunction

    virtual task actionTask();
      //<tbd> error message
      $finish(1);
    endtask: actionTask

    virtual function void signedMetaActionFunction(longint signed value);
      //<tbd> error message
      $finish(1);
    endfunction: signedMetaActionFunction

    virtual task signedMetaActionTask(longint signed value);
      //<tbd> error message
      $finish(1);
    endtask: signedMetaActionTask

    virtual function void unsignedMetaActionFunction(longint unsigned value);
      //<tbd> error message
      $finish(1);
    endfunction: unsignedMetaActionFunction

    virtual task unsignedMetaActionTask(longint unsigned value);
      //<tbd> error message
      $finish(1);
    endtask: unsignedMetaActionTask

    virtual function longint signed signedMetaActionImportFunction();
      //<tbd> error message
      $finish(1);
      return -1;
    endfunction: signedMetaActionImportFunction

    virtual task signedMetaActionImportTask(output longint signed value);
      //<tbd> error message
      $finish(1);
    endtask: signedMetaActionImportTask

    virtual function longint unsigned unsignedMetaActionImportFunction();
      //<tbd> error message
      $finish(1);
      return 64'hFFFFFFFFFFFFFFFF;
    endfunction: unsignedMetaActionImportFunction

    virtual task unsignedMetaActionImportTask(output longint unsigned value);
      //<tbd> error message
      $finish(1);
    endtask: unsignedMetaActionImportTask

  endclass: FunctorBase

  function void do_actionFunction(input int object);
    FunctorBase base;
    base = FunctorBase::get(object);
    base.actionFunction();
  endfunction: do_actionFunction
  export "DPI-C" function do_actionFunction;

  task do_actionTask(input int object);
    FunctorBase base;
    base = FunctorBase::get(object);
    base.actionTask();
  endtask: do_actionTask
  export "DPI-C" task do_actionTask;

  function void do_signedMetaActionFunction(input int object, 
                                            input longint signed value);
    FunctorBase base;
    base = FunctorBase::get(object);
    base.signedMetaActionFunction(value);
  endfunction: do_signedMetaActionFunction
  export "DPI-C" function do_signedMetaActionFunction;

  task do_signedMetaActionTask(input int object, input longint signed value);
    FunctorBase base;
    base = FunctorBase::get(object);
    base.signedMetaActionTask(value);
  endtask: do_signedMetaActionTask
  export "DPI-C" task do_signedMetaActionTask;

  function void do_unsignedMetaActionFunction(input int object, 
                                              input longint unsigned value);
    FunctorBase base;
    base = FunctorBase::get(object);
    base.unsignedMetaActionFunction(value);
  endfunction: do_unsignedMetaActionFunction
  export "DPI-C" function do_unsignedMetaActionFunction;

  task do_unsignedMetaActionTask(input int object, input longint unsigned value);
    FunctorBase base;
    base = FunctorBase::get(object);
    base.unsignedMetaActionTask(value);
  endtask: do_unsignedMetaActionTask
  export "DPI-C" task do_unsignedMetaActionTask;

  function longint signed do_signedMetaActionImportFunction(input int object);
    FunctorBase base;
    base = FunctorBase::get(object);
    return base.signedMetaActionImportFunction();
  endfunction
  export "DPI-C" function do_signedMetaActionImportFunction;

  task do_signedMetaActionImportTask(input int object, 
                                     output longint signed value);
    FunctorBase base;
    base = FunctorBase::get(object);
    base.signedMetaActionImportTask(value);
  endtask: do_signedMetaActionImportTask
  export "DPI-C" task do_signedMetaActionImportTask;

  function longint unsigned do_unsignedMetaActionImportFunction(input int object);
    FunctorBase base;
    base = FunctorBase::get(object);
    return base.unsignedMetaActionImportFunction();
  endfunction: do_unsignedMetaActionImportFunction
  export "DPI-C" function do_unsignedMetaActionImportFunction;

  task do_unsignedMetaActionImportTask(input int object, 
                                       output longint unsigned value);
    FunctorBase base;
    base = FunctorBase::get(object);
    base.unsignedMetaActionImportTask(value);
  endtask: do_unsignedMetaActionImportTask
  export "DPI-C" task do_unsignedMetaActionImportTask;

    // Callbacks for coverage
    // typedef for callback reason
  typedef enum { Started = 0, 
                 Progress,
                 DistributionChunkCovered,
                 Covered } 
          CoverageCallbackReason;

  typedef class PathCoverage;
    // base class for path coverage callback
  virtual class PathCoverageCallback;
    // callback function that can be overridden
    virtual function void trigger(PathCoverage pc, 
                                  CoverageCallbackReason reason);
    endfunction: trigger
  endclass: PathCoverageCallback

/****
 * Declarations of imported C functions used in class PathCoverage
 * Do not call these directly.
 ****/
  import "DPI-C" context function 
    chandle _inFact_newPathCoverage1(input string startNodeName,
                                     input string pathCoverageName,
                                     input chandle testengine);
  import "DPI-C" context function 
    chandle _inFact_newPathCoverage2(input string testengineName,
                                     input string startNodeName,
                                     input string pathCoverageName,
                                     input bit attachAllTestengines);
  import "DPI-C" context function
    void _inFact_deletePathCoverage(input chandle me);
  import "DPI-C" context function
    void _inFact_pc_setSpecificationComplete(input chandle me);
  import "DPI-C" context function
    void _inFact_pc_attachTestEngine(input chandle me, input chandle testengine);
  import "DPI-C" context function
    void _inFact_pc_detachTestEngine(input chandle me, input chandle testengine);
  import "DPI-C" context function
    string _inFact_getPathCoverageName(input chandle me);
  import "DPI-C" context function
    void _inFact_addBinScheme(input chandle me, 
      input string binSchemeName, input int pri);
  import "DPI-C" context function
    void _inFact_addPathConstraint(input chandle me,
      input string constraintName);
  import "DPI-C" context function
    void _inFact_addPathStartNode(input chandle me, input string nodeName);
  import "DPI-C" context function
    void _inFact_addPathStopNode(input chandle me, input string nodeName);
  import "DPI-C" context function
    void _inFact_setGoalPathHitCount(input chandle me,
                                     input int newGoalPathHitCount);
  import "DPI-C" context function
    int _inFact_getGoalPathHitCount(input chandle me);
  import "DPI-C" context function
    void _inFact_setMinPathLength(input chandle me, input int newMinPathLength);
  import "DPI-C" context function
    int _inFact_getMinPathLength(input chandle me);
  import "DPI-C" context function
    void _inFact_setMaxPathLength(input chandle me, input int newMaxPathLength);
  import "DPI-C" context function
    int _inFact_getMaxPathLength(input chandle me);
  import "DPI-C" context function
    bit _inFact_pc_chunkCoverageGoalsHaveBeenMet(input chandle me);
  import "DPI-C" context function
    bit _inFact_pc_allCoverageGoalsHaveBeenMet(input chandle me);
  import "DPI-C" context function
    void _inFact_pc_setPriority(input chandle me, input int newPriority);
  import "DPI-C" context function
    int _inFact_pc_getPriority(input chandle me);
  import "DPI-C" context function
    void _inFact_pc_setDoNotDistribute(input chandle me);
  import "DPI-C" context function
    bit _inFact_pc_currentResults(input chandle me,
                                  output int numberOfPathsFound,
                                  output int numberOfPathsFullyCovered);
  import "DPI-C" context function
    void _inFact_pc_printNotDone(input chandle me,
                                 input int minNumberOfHits,
                                 input int maxNumberOfHits,
                                 input int maxNumberOfPathsToPrint,
                                 input byte separator);
  import "DPI-C" context function
    void _inFact_pc_setCallback(input chandle me);
  import "DPI-C" context function
    void _inFact_pc_unsetCallback(input chandle me);
`ifdef INCA
  import "DPI-C" context function
    void _inFact_pc_remember(input chandle me, input int index);
  import "DPI-C" context function
    int _inFact_pc_recall(input chandle me);
  import "DPI-C" context function
    void _inFact_pc_forget(input chandle me);
`endif
    
/****
 * PathCoverage: a class that causes a testengine to cover
 *               the paths between start and stop actions 
 *               defined in its rule.
 ****/

  class PathCoverage;
    // Attributes
    /* NYI local */ chandle _me;
    /* NYI local */ PathCoverageCallback _callback;
`ifndef INCA
    static PathCoverage _map[chandle];
`else
    static PathCoverage _map[int];
    static int nextIndex = 0;
`endif

    // Functions
    // constructor
    function new(string startNodeName,
                 string coverageName,
                 TestEngine testengine=null,
                 string testengineName = "",
                 bit attachAllTestengines = 1);
      if (testengine != null)
        _me = _inFact_newPathCoverage1(startNodeName, coverageName,
                                       testengine._me);
      else
        _me = _inFact_newPathCoverage2(testengineName, startNodeName,
                                       coverageName, attachAllTestengines);
      _callback = null;
`ifndef INCA
      _map[_me] = this;
`else
      _inFact_pc_remember(_me, nextIndex);
      _map[nextIndex] = this;
      nextIndex = nextIndex + 1;
`endif
    endfunction

    // 1 if methods can be called; 0, otherwise
    function bit valid();
      valid = (_me != null);
    endfunction

    // destructor
    function void delete();
      _inFact_deletePathCoverage(_me);
`ifndef INCA
      _map[_me] = null;
`else
      _inFact_pc_forget(_me);
`endif
      _me = null;
    endfunction

    // setSpecificationComplete current testengine
    function void setSpecificationComplete();
      _inFact_pc_setSpecificationComplete(_me);
    endfunction

    // attach current testengine
    function void attach(TestEngine te);
      _inFact_pc_attachTestEngine(_me, te._me);
    endfunction

    // detach current testengine
    function void detach(TestEngine te);
      _inFact_pc_detachTestEngine(_me, te._me);
    endfunction

    // get coverage name
    function string name();
      name = _inFact_getPathCoverageName(_me);
    endfunction

    // add a bin scheme to the path coverage
    function void addBinScheme(string binSchemeName, int pri=1);
      _inFact_addBinScheme(_me, binSchemeName, pri);
    endfunction

    function void addPathConstraint(string constraintName);
      _inFact_addPathConstraint(_me, constraintName);
    endfunction

    // add a start node to the path coverage
    function void addPathStartNode(string nodeName);
      _inFact_addPathStartNode(_me, nodeName);
    endfunction

    // add an action to stop the path in the coverage
    function void addPathStopNode(string nodeName);
      _inFact_addPathStopNode(_me, nodeName);
    endfunction

    // set goal count
    function void setGoalPathHitCount(int newGoalPathHitCount);
      _inFact_setGoalPathHitCount(_me, newGoalPathHitCount);
    endfunction

    // get goal count
    function int getGoalPathHitCount();
      getGoalPathHitCount = _inFact_getGoalPathHitCount(_me);
    endfunction

    // set the minimum path length
    function void setMinPathLength(int newMinPathLength);
      _inFact_setMinPathLength(_me, newMinPathLength);
    endfunction

    // get the minimum path length
    function int getMinPathLength();
      getMinPathLength = _inFact_getMinPathLength(_me);
    endfunction

    // set the maximum path length
    function void setMaxPathLength(int newMaxPathLength);
      _inFact_setMaxPathLength(_me, newMaxPathLength);
    endfunction

    // get the maximum path length
    function int getMaxPathLength();
      getMaxPathLength = _inFact_getMaxPathLength(_me);
    endfunction

    // 1, if all coverage goals have been met; 0, otherwise
    function bit chunkCoverageGoalsHaveBeenMet();
      chunkCoverageGoalsHaveBeenMet = _inFact_pc_chunkCoverageGoalsHaveBeenMet(_me);
    endfunction

    // 1, if all coverage goals have been met; 0, otherwise
    function bit allCoverageGoalsHaveBeenMet();
      allCoverageGoalsHaveBeenMet = _inFact_pc_allCoverageGoalsHaveBeenMet(_me);
    endfunction

    // set priority
    function void setPriority(int newPriority);
      _inFact_pc_setPriority(_me, newPriority);
    endfunction

    // get priority
    function int getPriority();
      getPriority = _inFact_pc_getPriority(_me);
    endfunction

    function void setDoNotDistribute();
      _inFact_pc_setDoNotDistribute(_me);
    endfunction

    // get results. returns 1 if all paths are found; 0 otherwise
    function bit currentResults(output int numberOfPathsFound,
                                output int numberOfPathsFullyCovered);
      currentResults = _inFact_pc_currentResults(_me, numberOfPathsFound,
                                                 numberOfPathsFullyCovered);
    endfunction

    // prints paths not yet covered to logfile
    function void printNotDone(int minNumberOfHits,
                               int maxNumberOfHits,
                               int maxNumberOfPathsToPrint,
                               byte separator = ":");
      _inFact_pc_printNotDone(_me, minNumberOfHits, maxNumberOfHits, 
                              maxNumberOfPathsToPrint, separator);
    endfunction

    function void setCallback(PathCoverageCallback cb);
      _inFact_pc_setCallback(_me);
      _callback = cb;
    endfunction

    function void unsetCallback();
      _inFact_pc_unsetCallback(_me);
      _callback = null;
    endfunction

    function void triggerCallback(int reason);
      automatic CoverageCallbackReason cbReason; 
      $cast(cbReason, reason);
      _callback.trigger(this, cbReason);
    endfunction

  endclass: PathCoverage

    // triggers the callback event
  function void pathCoverageCallback(input chandle me, input int reason);
`ifndef INCA
    if (PathCoverage::_map[me] != null) begin
      PathCoverage::_map[me].triggerCallback(reason);
    end
`else
    int index;
    index = _inFact_pc_recall(me);
    if (0 <= index) begin
      PathCoverage::_map[index].triggerCallback(reason);
    end
`endif
  endfunction
    // export pathCoverageCallback
  export "DPI-C" function pathCoverageCallback;

endpackage: inFactSv
