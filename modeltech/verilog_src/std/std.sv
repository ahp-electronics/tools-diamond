// This is the SystemVerilog builtin "std" package as defined in the
// P1800-2012 LRM
//
//   NOTE: VLOG and VSIM will not work properly if these declarations
//         are modified.
package std;

class semaphore;
    local chandle p1;
    local int keyCount;
    function new(int keyCount = 0);
    this.keyCount = keyCount;
    endfunction
    extern function void put(int keyCount = 1);
    extern task get(int keyCount = 1);
    extern function int try_get(int keyCount = 1);
endclass

class mailbox #(type T = integer);
    local T items[$];
    local int maxItems;
    local chandle read_awaiting;
    local chandle write_awaiting;
    local chandle qtd;

    function new(int maxItems = 0);
		semaphore unused_sema=new(0); // Unused, but kept to match 10.4 RNG behavior
      if (maxItems < 0) begin
        $display("** Warning: Ignoring illegal negative size in mailbox construction; using default");
        maxItems = 0;
      end
	  else if (maxItems > 0) begin
		unused_sema = new(0); // Unnecessary, but added to match 10.4 RNG behavior
	  end
      this.maxItems = maxItems;
    endfunction

    extern function int num();
    extern task put(input T message);
    extern function int try_put(input T message);
    extern task get(output T message);
    extern function int try_get((* mti_singular_type *) output T message);
    extern task peek(output T message);
    extern function int try_peek((* mti_singular_type *) output T message);
endclass

class process;
    typedef enum { FINISHED, RUNNING, WAITING, SUSPENDED, KILLED } state;
    extern local function new();    // illegal to call
    extern static function process self();
    extern function state status();
    extern function void kill();
    extern task await();
    extern function void suspend();
    extern function void resume();
    local byte status_flag;
endclass

function automatic int randomize(input int i);
endfunction

endpackage
