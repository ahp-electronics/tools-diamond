library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_bit.all;
package UPF is
   attribute mgc_type_signature : string;
   type state is (
            OFF,
            UNDETERMINED,
            PARTIAL_ON,
            FULL_ON
        );
   type supply_net_type is record
        state : state;
        voltage : ieee.numeric_bit.signed(31 downto 0);
   end record;

   constant volt_to_uvolt : real := 1000000.0;
    -- 2.0 type definitions
   subtype upf_object_handle is Integer;

   type object_kind is (ERROR_KIND,
       SWITCH, ISOLATION_CELL, LEVEL_SHIFTER,
       SUPPLY_SET, SUPPLY_NET, SUPPLY_PORT,
       ROOT_SUPPLY_DRIVER,
       LOGIC_NET, LOGIC_PORT,
       INSTANCE,
       POWER_DOMAIN,
       POWER_STATE,
       ITERATOR,
       OTHER_OBJ );
   -- NOTE: UNDETERMINED is not defined as a power state kind as
   -- it is replaced during simulation with a determined state
   type power_state_kind is
   (ERROR_PS, OPERATING, ILLEGAL, TRANSIENT);

--   type power_state_simstate is
  -- (NORMAL, CORRUPT, CORRUPT_ON_ACTIVITY, CORRUPT_ON_CHANGE, CORRUPT_STATE_ON_CHANGE, CORRUPT_STATE_ON_ACTIVITY);

--------------------------------------
-- Basic Types
--------------------------------------
subtype upfStringT is STRING;
subtype upfIntegerT is INTEGER;
subtype upfBooleanT is BIT;
subtype upfRealT is REAL;
subtype upfHandleT is INTEGER;
subtype upfIteratorT is INTEGER;  
subtype upfSupplyStateE is state;

constant upf_null : upfHandleT :=0 ;
   
type upfSupplyTypeT is record
    state : upfSupplyStateE;
    voltage : upfIntegerT; -- Voltage in microvolts
end record;

-- Legacy support: backward compatibility, this needs to be reversed when upf 3.0 is supported
--subtype upfSimstateE is power_state_simstate;
--subtype state is upfSupplyStateE;
--subtype supply_net_type is upfSupplyTypeT;

--------------------------------------
-- Native HDL Representation
--------------------------------------
type upfPowerStateObjT is record
    handle : upfHandleT;
    is_active : upfBooleanT;
end record;

type upfPdSsObjT is record
    handle : upfHandleT;
    current_state : upfPowerStateObjT;
end record;

type upfStateHolderObjT is record
    handle : upfHandleT;
    current_state : upfPowerStateObjT;
end record;

type upfBooleanObjT is record
    handle : upfHandleT;
    current_value : upfBooleanT;
end record;

type upfSupplyObjT is record
    handle : upfHandleT;
    current_value : upfSupplyTypeT;
end record;

--------------------------------------
-- HDL Type Mapping
--------------------------------------
subtype upfCompositeDomainT is upfPdSsObjT;
subtype upfPowerDomainT is upfPdSsObjT;
subtype upfSupplySetT is upfPdSsObjT;
subtype upfPstStateT is upfPowerStateObjT;
subtype upfPowerStateGroupT is upfStateHolderObjT;
subtype upfPowerStateT is upfPowerStateObjT;
subtype upfAckPortT is upfBooleanObjT;
subtype upfExpressionT is upfBooleanObjT;
subtype upfLogicNetT is upfBooleanObjT;
subtype upfLogicPortT is upfBooleanObjT;
subtype upfSupplyNetT is upfSupplyObjT;
subtype upfSupplyPortT is upfSupplyObjT;
subtype upfAttributeT is upfHandleT;
subtype upfCellT is upfHandleT;
subtype upfExtentT is upfHandleT;
subtype upfHdlMultiBitSliceT is upfHandleT;
subtype upfHdlNetBitT is upfHandleT;
subtype upfHdlNetMultiBitT is upfHandleT;
subtype upfHdlPortBitT is upfHandleT;
subtype upfHdlPortMultiBitT is upfHandleT;
subtype upfHdlScopeT is upfHandleT;
subtype upfIsolationStrategyT is upfHandleT;
subtype upfLevelShifterStrategyT is upfHandleT;
subtype upfNamedRefT is upfHandleT;
subtype upfPowerStateTableT is upfHandleT;
subtype upfPowerStateTransitionT is upfHandleT;
subtype upfPowerSwitchStateT is upfHandleT;
subtype upfPowerSwitchT is upfHandleT;
subtype upfRepeaterStrategyT is upfHandleT;
subtype upfRetentionStrategyT is upfHandleT;
subtype upfSignalSenseT is upfHandleT;
subtype upfSupplyPortStateT is upfHandleT;
subtype upfPowerModelT is upfHandleT;
subtype upfDesignT is upfHandleT;


--------------------------------------
-- Enumerations
--------------------------------------
-- Please note that the class ids will now be arranged in line with 
-- Table 39 as mentioned in UPF LRM 3.1 
-- The classes in the information model will be identified in HDL by
-- the enumerated values defined in upfClassIdE enumerated type :
type upfClassIdE is (
    --Abstract Class Id Class Name
    UPF_BASE,                               --upfBaseT
    UPF_BASE_NAMED,                         --upfBaseNamedT
    UPF_BASE_RELATIONSHIP,                  --upfBaseRelationshipT
    UPF_BASE_HDL,                           --upfBaseHdlT
    UPF_BASE_UPF,                           --upfBaseUpfT
    UPF_EXTENT_CLASS,                       --upfExtentClassT
    UPF_HDL_DECL,                           --upfHdlDeclT
    UPF_NETWORK_CLASS,                      --upfNetworkClassT
    UPF_STATE_CLASS,                        --upfStateClassT
    UPF_HDL_NET_CLASS,                      --upfHdlNetClassT
    UPF_HDL_PORT_CLASS,                     --upfHdlPortClassT
    UPF_NET_CLASS,                          --upfNetClassT
    UPF_PORT_CLASS,                         --upfPortClassT
    UPF_STRATEGY,                           --upfStrategyT
    UPF_BOUNDARY_STRATEGY,                  --upfBoundaryStrategyT
    --Concrete Class Id Class Name
    UPF_ACK_PORT,                           --upfAckPortT
    UPF_ISOLATION_STRATEGY,                 --upfIsolationStrategyT
    UPF_LEVEL_SHIFTER_STRATEGY,             --upfLevelShifterStrategyT
    UPF_LOGIC_NET,                          --upfLogicNetT
    UPF_LOGIC_PORT,                         --upfLogicPortT
    UPF_NAMED_REF,                          --upfNamedRefT
    UPF_POWER_DOMAIN,                       --upfPowerDomainT
    UPF_POWER_STATE,                        --upfPowerStateT
    UPF_POWER_STATE_TABLE,                  --upfPowerStateTableT
    UPF_POWER_STATE_TRANSITION,             --upfPowerStateTransitionT
    UPF_POWER_SWITCH_STATE,                 --upfPowerSwitchStateT
    UPF_POWER_SWITCH,                       --upfPowerSwitchT
    UPF_PST_STATE,                          --upfPstStateT
    UPF_REPEATER_STRATEGY,                  --upfRepeaterStrategyT
    UPF_RETENTION_STRATEGY,                 --upfRetentionStrategyT
    UPF_SUPPLY_NET,                         --upfSupplyNetT
    UPF_SUPPLY_PORT_STATE,                  --upfSupplyPortStateT
    UPF_SUPPLY_PORT,                        --upfSupplyPortT
    UPF_SUPPLY_SET,                         --upfSupplySetT
    UPF_HDL_MULTI_BIT_SLICE,                --upfHdlMultiBitSliceT
    UPF_HDL_NET_BIT,                        --upfHdlNetBitT
    UPF_HDL_NET_MULTI_BIT,                  --upfHdlNetMultiBitT
    UPF_HDL_PORT_BIT,                       --upfHdlPortBitT
    UPF_HDL_PORT_MULTI_BIT,                 --upfHdlPortMultiBitT
    UPF_HDL_SCOPE,                          --upfHdlScopeT
    UPF_ATTRIBUTE,                          --upfAttributeT
    UPF_CELL,                               --upfCellT
    UPF_EXPRESSION,                         --upfExpressionT
    UPF_EXTENT,                             --upfExtentT
    UPF_SIGNAL_SENSE,                       --upfSignalSenseT
    UPF_SUPPLY_TYPE,                        --upfSupplyTypeT
    UPF_COMPOSITE_DOMAIN,                   --upfCompositeDomainT
    -- Basic Property types
    UPF_BOOLEAN,                            --upfBooleanT
    UPF_STRING,                             --upfStringT
    UPF_INTEGER,                            --upfIntegerT
    UPF_REAL,                               --upfRealT
    --Concrete Class Id Class Name
    UPF_POWER_STATE_GROUP,                  --upfPowerStateGroupT
    UPF_POWER_MODEL,                        --upfPowerModelT
    UPF_DESIGN,                             --upfDesignT
    -- Basic Property types
    UPF_ITERATOR                            --upfIteratorT
);

-- The following table provides the mapping between the property
-- names and property IDs in HDL type.
type upfPropertyIdE is (
--Property Id Class Name
    UPF_ACK_DELAY,                          --upfAckPortT
    UPF_ACK_PORTS,                          --upfPowerSwitchT
    UPF_APPLIES_TO,                         --upfBoundaryStrategyT
    UPF_ATTR_NAME,                          --upfAttributeT
    UPF_ATTR_VALUE,                         --upfAttributeT
    UPF_CELL_INFO,                          --upfBaseHdlT
    UPF_CELL_KIND,                          --upfCellT
    UPF_CELL_ORIGIN,                        --upfCellT
    UPF_CELLS,                              --upfExtentT
    UPF_CHILD_INSTANCES,                    --upfHdlScopeT
    UPF_CLAMP_VALUES,                       --upfIsolationStrategyT
    UPF_CONTROL_PORTS,                      --upfPowerSwitchT
    UPF_CONTROL_SIGNAL,                     --upfSignalSenseT
    UPF_CREATION_SCOPE,                     --upfBaseUpfT
    UPF_CURRENT_STATE,                      --upfPowerDomainT,
                                            -- upfCompositeDomainT,
                                            -- upfSupplySetT,
                                            -- upfPowerStateTableT
    UPF_CURRENT_VALUE,                      --upfExpressionT, upfSupplyNetT,
                                            -- upfSupplyPortT, upfLogicNetT,
                                            -- upfLogicPortT, upfAckPortT
    UPF_EFFECTIVE_EXTENTS,                  --upfExtentClassT
    UPF_EQUIVALENT_SETS,                    --upfSupplySetT
    UPF_EXPR_OPERANDS,                      --upfExpressionT
    UPF_EXPR_STRING,                        --upfExpressionT
    UPF_EXTENTS,                            --upfBaseHdlT
    UPF_FANIN_CONN,                         --upfNetClassT
    UPF_FANOUT_CONN,                        --upfNetClassT
    UPF_FILE,                               --upfBaseT
    UPF_FROM_STATES,                        --upfPowerStateTransitionT
    UPF_FUNCTIONS,                          --upfSupplySetT
    UPF_HDL_ATTRIBUTES,                     --upfBaseHdlT
    UPF_HDL_CELL_KIND,                      --upfCellT
    UPF_HDL_ELEMENT,                        --upfExtentT
    UPF_HDL_IMPLEMENTATION,                 --upfNetworkClassT
    UPF_HDL_ITEMS,                          --upfHdlScopeT
    UPF_HDL_PORTS,                          --upfHdlScopeT
    UPF_HDL_WIDTH,                          --upfHdlNetMultiBitT,
                                            -- upfHdlPortMultiBitT
    UPF_HICONN,                             --upfPortClassT
    UPF_INPUT_SUPPLY_PORT,                  --upfPowerSwitchStateT
    UPF_INPUT_SUPPLY_PORTS,                 --upfPowerSwitchT
    UPF_IS_ACTIVE,                          --upfPowerStateT, upfPstStateT
    UPF_IS_DIFF_SUPPLY_ONLY,                --upfIsolationStrategyT
    UPF_IS_FORCE_ISOLATION,                 --upfIsolationStrategyT
    UPF_IS_FORCE_SHIFT,                     --upfLevelShifterStrategyT
    UPF_IS_ILLEGAL,                         --upfStateClassT
    UPF_IS_NO_ISOLATION,                    --upfIsolationStrategyT
    UPF_IS_NO_RETENTION,                    --upfRetentionStrategyT
    UPF_IS_NO_SHIFT,                        --upfLevelShifterStrategyT
    UPF_IS_USE_EQUIVALENCE,                 --upfBoundaryStrategyT
    UPF_IS_USE_RETENTION_AS_PRIMARY,        --upfRetentionStrategyT
    UPF_ISOLATION_CONTROLS,                 --upfIsolationStrategyT
    UPF_ISOLATION_STRATEGIES,               --upfPowerDomainT
    UPF_ITEMS,                              --upfHdlScopeT
    UPF_LEVEL_SHIFT_RULE,                   --upfLevelShifterStrategyT
    UPF_LEVEL_SHIFTER_STRATEGIES,           --upfPowerDomainT
    UPF_LINE,                               --upfBaseT
    UPF_LOCATION,                           --upfBoundaryStrategyT
    UPF_LOCONN,                             --upfPortClassT
    UPF_LOGIC_EXPR,                         --upfPowerStateT
    UPF_LOGIC_REFS,                         --upfStrategyT
    UPF_LOWER_BOUNDARY,                     --upfPowerDomainT
    UPF_LSB,                                --upfHdlMultiBitSliceT
    UPF_MODEL_NAME,                         --upfCellT
    UPF_MSB,                                --upfHdlMultiBitSliceT
    UPF_NAME,                               --upfBaseT
    UPF_NAME_PREFIX,                        --upfBoundaryStrategyT
    UPF_NAME_SUFFIX,                        --upfBoundaryStrategyT
    UPF_NETWORK_ATTRIBUTES,                 --upfNetworkClassT
    UPF_NEXT_EXTENT,                        --upfExtentT
    UPF_NORMALIZED_BITS,                    --upfHdlNetMultiBitT,
                                            -- upfHdlPortMultiBitT
    UPF_NORMALIZED_IDX,                     --upfHdlNetBitT, upfHdlPortBitT
    UPF_OBJECT,                             --upfExtentT
    UPF_OUTPUT_SUPPLY_PORT,                 --upfPowerSwitchT
    UPF_PARENT,                             --upfBaseT
    UPF_PD_STATE_TRANSITIONS,               --upfPowerDomainT,
                                            -- upfCompositeDomainT
    UPF_PD_STATES,                          --upfPowerDomainT,
                                            -- upfCompositeDomainT
    UPF_PORT_DIR,                           --upfHdlPortClassT, upfPortClassT
    UPF_PST_HEADER,                         --upfPowerStateTableT
    UPF_PST_STATES,                         --upfPowerStateTableT
    UPF_REF_KIND,                           --upfNamedRefT
    UPF_REF_OBJECT,                         --upfNamedRefT
    UPF_REPEATER_STRATEGIES,                --upfPowerDomainT
    UPF_RESOLVE_TYPE,                       --upfSupplyNetT
    UPF_RESTORE_CONDITION,                  --upfRetentionStrategyT
    UPF_RESTORE_SIGNAL,                     --upfRetentionStrategyT
    UPF_RETENTION_CONDITION,                --upfRetentionStrategyT
    UPF_RETENTION_PARAMETERS,               --upfRetentionStrategyT
    UPF_RETENTION_STRATEGIES,               --upfPowerDomainT
    UPF_ROOT_DRIVER,                        --upfNetworkClassT
    UPF_SAVE_CONDITION,                     --upfRetentionStrategyT
    UPF_SAVE_SIGNAL,                        --upfRetentionStrategyT
    UPF_SIGNAL_SENSITIVITY,                 --upfSignalSenseT
    UPF_SIMSTATE,                           --upfPowerStateT
    UPF_SINK_FILTER,                        --upfBoundaryStrategyT
    UPF_SLICE_BITS,                         --upfHdlMultiBitSliceT
    UPF_SMALLEST_ATOMIC_SLICE,              --upfHdlNetBitT, upfHdlPortBitT
    UPF_SOURCE_EXTENTS,                     --upfCellT
    UPF_SOURCE_FILTER,                      --upfBoundaryStrategyT
    UPF_SP_STATES,                          --upfSupplyPortT
    UPF_SS_STATES,                          --upfSupplySetT
    UPF_SS_TRANSITIONS,                     --upfSupplySetT
    UPF_STATE,                              --upfSupplyTypeT
    UPF_SUBDOMAINS,                         --upfCompositeDomainT
    UPF_SUPPLY_EXPR,                        --upfPowerStateT
    UPF_SUPPLY_SET_HANDLES,                 --upfExtentClassT,
                                            -- upfCompositeDomainT
    UPF_SUPPLY_STATE,                       --upfSupplyPortStateT
    UPF_SUPPLY_STATES,                      --upfPstStateT
    UPF_SW_STATES,                          --upfPowerSwitchT
    UPF_SWITCH_EXPR,                        --upfPowerSwitchStateT
    UPF_SWITCH_OUTPUT_STATE,                --upfPowerSwitchStateT
    UPF_THRESHOLD_VALUE,                    --upfLevelShifterStrategyT
    UPF_TO_STATES,                          --upfPowerStateTransitionT
    UPF_UPPER_BOUNDARY,                     --upfPowerDomainT
    UPF_USER_CLAMP_VALUES,                  --upfIsolationStrategyT
    UPF_VOLTAGE,                            --upfSupplyTypeT
    UPF_VOLT_KIND,                          --upfSupplyPortStateT
    UPF_VOLT_MAX,                           --upfSupplyPortStateT
    UPF_VOLT_MIN,                           --upfSupplyPortStateT
    UPF_VOLT_NOM,                           --upfSupplyPortStateT

    -- Added in UPF 3.1
    UPF_GROUP_STATES,                       --upfPowerStateGroupT
    UPF_GROUP_STATE_TRANSITIONS,            --upfPowerStateGroupT
    UPF_SN_STATES,                          --upfSupplyNetT
    UPF_POWER_EXPR,                         --upfPowerStateT
    UPF_CORRELATED_SUPPLIES,                --upfSupplyPortT,
                                            -- upfSupplyNetT
    UPF_FOR_MODELS,                         --upfPowerModelT
    UPF_AVAILABLE_SUPPLIES,                 --upfPowerDomainT
    UPF_BOUNDARY_SUPPLIES,                  --upfPowerDomainT
    UPF_CURRENT_SIMSTATE,                   --upfPowerDomainT
                                            --upfSupplySetT
    UPF_POWER_MODELS,                       --upfDesignT
    UPF_PARTIAL_ON_TRANSLATION,             --upfDesignT
    UPF_POWER_DOMAINS,                      --upfDesignT,
                                            -- upfHdlScopeT
    UPF_SWITCH_TYPE,                        --upfPowerSwitchT
    UPF_APPLIES_TO_BOUNDARY                 --upfBoundaryStrategyT

);


type upfAppliesToFilterE is (
    UPF_FILTER_UNDEF,                       -- Undefined
    UPF_FILTER_INPUTS,                      -- -applies_to inputs
    UPF_FILTER_OUTPUTS,                     -- -applies_to outputs
    UPF_FILTER_BOTH                         -- -applies_to both
);
type upfCellKindE is (
    UPF_CELL_NONE,                          -- not a cell
    UPF_CELL_ISOLATION,                     -- represents isolation cell
    UPF_CELL_LEVEL_SHIFTER,                 -- represents level shifter cell
    UPF_CELL_ISO_LS_COMBO,                  -- represents isolation and level
                                            -- shifter combo cell
    UPF_CELL_RETENTION,                     -- represents retention cell
    UPF_CELL_SWITCH,                        -- represents a switch cell
    UPF_CELL_REPEATER,                      -- represents a repeater or buffer cell
    UPF_CELL_CORRUPT,                       -- represents any standard cell which
                                            -- can get corrupted
    UPF_CELL_MACRO                          -- represents a macro cell or power
                                            -- model
);
type upfCellOriginE is (
    UPF_ORIGIN_UNKNOWN,                     -- When cell origin is not known
    UPF_ORIGIN_DESIGN,                      -- When cell is present in design
                                            -- itself
    UPF_ORIGIN_INSERTED,                    -- When cell is inserted by UPF after
                                            -- application of strategy (e.g.
                                            -- isolation) and using default
                                            -- model.
    UPF_ORIGIN_INSERTED_MAP,                -- When cell is inserted by UPF after
                                            -- application of strategy and using
                                            -- user specified model via map_*
                                            -- and use_interface_cell commands
    UPF_ORIGIN_INFERRED                     -- When cell is inferred by UPF at RTL.
                                            -- This information will only be
                                            -- present on cells which are set on
                                            -- HDL Port or Nets group of objects.
); 

type upfHdlCellKindE is (
    UPF_HDLCELL_NONE,                       -- not a cell
    UPF_HDLCELL_COMB,                       -- represents a combinatorial logic
    UPF_HDLCELL_FLOP,                       -- represents a flip flop
    UPF_HDLCELL_LATCH,                      -- represents a latch
    UPF_HDLCELL_MEM                         -- represents a memory like ram, etc.
);
type upfIsolationClampE is (
    UPF_CLAMP_UNDEF,                        -- Undefined
    UPF_CLAMP_ZERO,                         -- -*_clamp 0
    UPF_CLAMP_ONE,                          -- -*_clamp 1
    UPF_CLAMP_ZEE,                          -- -*_clamp Z
    UPF_CLAMP_LATCH,                        -- -*_clamp latch
    UPF_CLAMP_ANY,                          -- -*_clamp any
    UPF_CLAMP_USER_VALUE                    -- -*_clamp value
);
type upfLevelShifterRuleE is (
    UPF_LS_LOW_TO_HIGH,                     -- -rule low_to_high
    UPF_LS_HIGH_TO_LOW,                     -- -rule high_to_low
    UPF_LS_BOTH                             -- -rule both
);
type upfLocationE is (
    SELF,                                   -- -location self
    OTHER,                                  -- -location other
    PARENT,                                 -- -location parent
    AUTOMATIC,                              -- -location automatic
    FANOUT                                  -- -location fanout
);
type upfNamedRefKindE is (
    UPF_REF_POWER,                          -- power function of supply set
    UPF_REF_GROUND,                         -- ground function of supply set
    UPF_REF_PWELL,                          -- pwell function of supply set
    UPF_REF_NWELL,                          -- nwell function of supply set
    UPF_REF_DEEPPWELL,                      -- deeppwell function of supply set
    UPF_REF_DEEPNWELL,                      -- deepnwell function of supply set
    UPF_REF_ISO_SIGNAL,                     -- reference to isolation control
                                            -- signal in set_isolation
    UPF_REF_SAVE_SIGNAL,                    -- to save_signal in set_retention
    UPF_REF_RESTORE_SIGNAL,                 -- reference to restore_signal in
                                            -- set_retention
    UPF_REF_GENERIC_CLOCK,                  -- reference to UPF_GENERIC_CLOCK in
                                            -- set_retention
    UPF_REF_GENERIC_DATA,                   -- reference to UPF_GENERIC_DATA in
                                            -- set_retention
    UPF_REF_GENERIC_ASYNC_LOAD,             -- reference to UPF_GENERIC_ASYNC_LOAD
                                            -- in set_retention
    UPF_REF_GENERIC_OUTPUT,                 -- reference to UPF_GENERIC_OUTPUT in
                                            -- set_retention
    UPF_REF_USER_DEFINED                    -- some user defined ref handle
);
type upfPortDirE is (
    UPF_DIR_UNDEF,                          -- Undefined
    UPF_DIR_IN,                             -- -direction in
    UPF_DIR_OUT,                            -- -direction out
    UPF_DIR_INOUT                           -- -direction inout
);
type upfResolveE is (
    UNRESOLVED,                             -- -resolve unresolved
    ONE_HOT,                                -- -resolve one_hot
    PARALLEL,                               -- -resolve parallel
    PARALLEL_ONE_HOT                        -- -resolve parallel_one_hot
);
type upfRetentionParamE is (
    RET_SUP_COR,
    NO_RET_SUP_COR,
    SAV_RES_COR,
    NO_SAV_RES_COR
);
type upfSignalSenseKindE is (
    UPF_SENSE_HIGH,                         -- high
    UPF_SENSE_LOW,                          -- low
    UPF_SENSE_POSEDGE,                      -- posedge
    UPF_SENSE_NEGEDGE                       -- negedge
);
type upfSimstateE is (
    CORRUPT,                                 -- -simstate CORRUPT or -simstate
                                            -- NOT_NORMAL
    CORRUPT_ON_ACTIVITY,                    -- -simstate CORRUPT_ON_ACTIVITY or
                                            -- -simstate NOT_NORMAL
    CORRUPT_ON_CHANGE,                      -- -simstate CORRUPT_ON_CHANGE or
                                            -- -simstate NOT_NORMAL
    CORRUPT_STATE_ON_ACTIVITY,              -- -simstate CORRUPT_STATE_ON_ACTIVITY
                                            -- or -simstate NOT_NORMAL
    CORRUPT_STATE_ON_CHANGE,                -- -simstate CORRUPT_STATE_ON_CHANGE
                                            -- or -simstate NOT_NORMAL
    NORMAL                                  -- -simstate NORMAL
);

subtype power_state_simstate is upfSimstateE;

type upfVoltKindE is (
    NOM,                                    -- when only nominal value is specified
                                            -- in add_port_state command
    DOUBLET,                                -- when a doublet is specified in
                                            -- add_port_state command
    TRIPLET                                 -- when a triplet is specified in
                                            -- add_port_state command
);

-- Added in UPF 3.1 39
type upfSwitchTypeE is (
UPF_SW_COARSE_GRAIN, -- -switch_type coarse_grain
UPF_SW_FINE_GRAIN, -- -switch_type fine_grain
UPF_SW_BOTH -- -switch_type both
);

type upfAppliesToBoundaryE is (
UPF_BOUNDARY_UNDEF, -- Undefined
UPF_BOUNDARY_LOWER, -- -applies_to_boundary lower
UPF_BOUNDARY_UPPER, -- -applies_to_boundary upper
UPF_BOUNDARY_BOTH -- -applies_to_boundary both
);

-- UPF 3.0 package functions -------
--------------------------------------
-- HDL Access Functions
--------------------------------------
-- Purpose: Get a handle to a given object from the pathname
impure function upf_get_handle_by_name (
    -- A string representing handle ID for an object
    pathname : upfStringT;
    -- An optional handle to the object from which the relative
    -- pathname is given
    relative_to : upfHandleT := 0)
    -- Return Value: Returns the handle to the specified property or
    -- null if not found
return upfHandleT;

--------------------------------------
-- Purpose: Query property on a given object
impure function upf_query_object_properties (
    -- UPF Handle of the given object
    object_handle : upfHandleT;
    -- The enumerated value corresponding to the given property on the
    -- object
    prop : upfPropertyIdE)
    -- Return Value: Returns the handle to the specified property or
    -- null if not found
return upfHandleT;

--------------------------------------
-- Purpose: Get the next handle from the iterator
impure function upf_iter_get_next (
    -- Handle to the iterator
    iter_handle : upfIteratorT)
    -- Return Value: Returns the handle to the next element in the
    -- iterator or 0 if no element is present.
return upfHandleT;

--------------------------------------
-- Immediate Read Access Functions
--------------------------------------
-- The following table provides the mapping of basic property and the
-- read access routine to get the value.
-------------------------------------------------
-- Type Name VHDL
-------------------------------------------------
-- upfStringT upf_get_value_str()
-- upfIntegerT upf_get_value_int()
-- upfBooleanT upf_get_value_int()
-- All Enumerated Types upf_get_value_int()
-- upfRealT upf_get_value_real()

-------------------------------------------------
-- Purpose: Get the string value from property handle
impure function upf_get_value_str (
    -- Handle to the property
    prop : upfHandleT)
    -- Return Value: Returns string value of the given property handle
    -- or empty string if error.
return upfStringT;

--------------------------------------
-- Purpose: Get the integer value from property handle
impure function upf_get_value_int (
    -- Handle to the property
    prop : upfHandleT)
    -- Return Value: Returns integer value of the given property
    -- handle.
return upfIntegerT;

--------------------------------------
-- Purpose: Get the real value from property handle
impure function upf_get_value_real (
    -- Handle to the property
    prop : upfHandleT)
    -- Return Value: Returns real value of the given property handle.
return upfRealT;

--------------------------------------
-- Purpose: Get the value of supply net type from the property handle
    impure function upf_get_label_upfSupplyTypeT (
    -- Handle to the property
    prop : upfHandleT)
    -- Return Value: Returns upfSupplyTypeT for given property handle.
return upfSupplyTypeT;

--------------------------------------
-- Purpose: Get the supply value of a Net
--impure function get_supply_value (
--    -- A string representing pathname of supply net
--    name : upfStringT)
--    -- Return Value Returns upfSupplyTypeT for given supply net.
--return upfSupplyTypeT;

--------------------------------------
-- Purpose: Get the supply voltage of a net
--impure function get_supply_voltage (
    -- An HDL object of upfSupplyTypeT
--    arg : upfSupplyTypeT)
    -- Return Value: Returns supply voltage of given upfSupplyTypeT
--return upfRealT;

--------------------------------------
-- Purpose: Get the supply FULL_ON state
--impure function get_supply_on_state (
--    -- An object of upfSupplyTypeT
--    arg : upfSupplyTypeT)
--    -- Return Value: Returns 1 when supply net state is FULL_ON or
--    -- PARTIAL_ON and set_partial_on_translation FULL_ON
--    -- is called. It returns 0 in other cases.
--return upfBooleanT;

--------------------------------------
-- Purpose: Get the state from a supply net
--impure function get_supply_state (
--    -- An object of upfSupplyTypeT
--    arg : upfSupplyTypeT)
--    -- Return Value: Returns state of the supply net
--return upfSupplyStateE;

--------------------------------------
-- Immediate Write Access Functions
--------------------------------------
-- The following table provides the mapping between basic property
-- types and corresponding hdl function to write the value
------------------------------------------------------------
-- Type Name VHDL
------------------------------------------------------------
-- upfStringT -
-- upfIntegerT upf_set_value_int()
-- upfBooleanT upf_set_value_int()
-- All Enumerated Types upf_set_value_int(
-- upfRealT -
-- upfSupplyTypeT upf_set_value_upfSupplyTypeT()

------------------------------------------------------------
-- Purpose: Sets the integer value on the dynamic property
impure function upf_set_value_int (
    -- Handle to the property
    prop : upfHandleT;
    -- Value
    value : upfIntegerT)
    -- Return Value: Returns 1 on success, 0 on failure
return upfBooleanT;

--------------------------------------
-- Purpose: Sets the upfSupplyTypeT value on the dynamic property
impure function upf_set_value_upfSupplyTypeT (
    -- Handle to the property
    prop : upfHandleT;
    -- Value of type upfSupplyTypeT
    value : upfSupplyTypeT)
    -- Return Value: Returns 1 on success, 0 on failure
return upfBooleanT;

--------------------------------------
-- Purpose: Change state of supply to FULL_ON and specify voltage
--impure function supply_on (
--    -- A string representing pathname of the root supply
--    supply_name : upfStringT;
--    -- Voltage value in real
--    value : upfRealT := 1.0)
--    -- Return Value: Returns 1 on success, 0 on failure
--return upfBooleanT;

--------------------------------------
-- Purpose: Change state of supply to OFF
--impure function supply_off (
--    -- A hierarchical path ID for a root supply.
--    supply_name : upfStringT)
--    -- Return Value: Returns 1 on success, 0 on failure
--return upfBooleanT;

--------------------------------------
-- Purpose: Change state of supply to PARTIAL_ON and specify voltage
--impure function supply_partial_on (
--    -- A string representing pathname of the root supply
--    supply_name : upfStringT;
--    -- Voltage value in real
--    value : upfRealT := 1.0)
--    -- Return Value: Returns 1 on success, 0 on failure
--return upfBooleanT;

--------------------------------------
-- Purpose: Assign the specified supply state to this object.
impure function set_supply_state (
    -- the hierarchical path ID of a supply port, net or supply set function
    object_name : upfStringT;
    -- one of OFF, PARTIAL_ON, FULL_ON, UNDETERMINED
    supply_state : upfSupplyStateE)
    -- Return Value: Returns 1 on success, 0 on failure
return upfBooleanT;

--------------------------------------
-- Purpose: Make the specified power state active for this object.
impure function set_power_state_by_handle (
    -- Handle to the UPF object
    object : upfHandleT;
    -- Handle of the power state present on the object
    power_state : upfHandleT)
    -- Return Value: Returns 1 on success, 0 on failure
return upfBooleanT;

--------------------------------------
-- Purpose: Make the specified power state active for this object.
--impure function set_power_state (
--    -- the hierarchical path ID of a supply set, power domain,
--    -- composite domain, group, model, or instance
--    object_name : upfStringT;
--    -- the simple name of a power state of that object
--    power_state : upfStringT)
--    -- Return Value: Returns 1 on success, 0 on failure
--return upfBooleanT;

--------------------------------------
-- Continuous Access Functions
--------------------------------------
-- Purpose: Create a continuous monitor that monitors the dynamic
-- property on the given object
impure function upf_create_object_mirror (
    -- A string representing hierarchical path ID of the source object
    -- whose value will be continuously monitored
    src : UpfStringT;
    -- A string representing hierarchical path ID of the destination
    -- object on which the value will be transferred from source
    -- object
    dst : UpfStringT)
    -- Return Value: Returns 1 when mirroring is successful or 0
    -- otherwise
return upfBooleanT;

--------------------------------------
-- Utility Functions
--------------------------------------
-- Purpose: Get the class id of the given object handle
impure function upf_query_object_type (
    -- Handle to the object or property
    handle : upfHandleT)
    -- Return Value: Returns enumerated value representing class of the
    -- given object or property
return upfClassIdE;

--------------------------------------
-- Purpose Check if object belongs to particular class
impure function upf_object_in_class (
    -- Handle to the object or property
    handle : upfHandleT;
    -- The enumerated value representing the class of the object.
    class_id : upfClassIdE)
    -- Return Value: Returns 1 when handle belongs to class and 0
    -- otherwise.
return upfBooleanT;

--------------------------------------
-- Purpose: Get the pathname of the given handle
impure function upf_query_object_pathname (
    -- Handle to a valid object
    object : upfHandleT;
    -- An optional handle to the object from which the relative
    -- pathname is required
    relative_to : upfHandleT := 0)
    -- Return Value: Returns the hierarchical pathname of the given
    -- object
return upfStringT;

--------------------------------------
-- Purpose: Converts the voltage value in volts represented as real
-- value to micro volts represented as integer.
impure function upf_convert_real_volts_to_int_uvolts (
    -- Voltage value in volts represented as a real number
    volt : upfRealT)
    -- Return Value: Returns the converted value of voltage in real
    -- converted to integer value in micro volts
return upfIntegerT;

--------------------------------------
-- Purpose: Converts the voltage in micro volts represented as
-- integer to volts represented as real value
impure function upf_convert_int_uvolts_to_real_volts (
    -- Voltage value in micro volts represented as a integer number
    uvolt : upfIntegerT)
    -- Return Value: Returns the converted value of voltage in micro
    -- volts represented as integer to volts represented
    -- as real value
return upfRealT;

--------------------------------------
-- Pre-defined supply net resolution functions
--------------------------------------
type upfSupplyTypeVectorT is array (INTEGER range <>) of upfSupplyTypeT;
type supply_net_type_vector is array (INTEGER range <>) of supply_net_type;

impure function one_hot (
    sources: upfSupplyTypeVectorT)
    return upfSupplyTypeT;
impure function parallel (
    sources: upfSupplyTypeVectorT)
    return upfSupplyTypeT;
impure function parallel_one_hot (
    sources: upfSupplyTypeVectorT)
    return upfSupplyTypeT;


-- UPF 2.0 package functions -------
    subtype supply_kind is object_kind range SUPPLY_NET to ROOT_SUPPLY_DRIVER;

    attribute mgc_type_signature of supply_net_type : type is "UPF__supply_net_type";

    function supply_on ( pad_name : IN string ; value : IN real ) return boolean;
     
    function supply_off ( pad_name : IN string ) return boolean;
     
    function supply_partial_on ( pad_name : IN string; value : real ) return boolean;
     
    function get_supply_value ( pad_name : IN string ) return supply_net_type;
     
    function get_supply_voltage ( value : IN supply_net_type ) return real;
     
    function get_supply_on_state ( value : IN supply_net_type ) return boolean;
     
    function get_supply_on_state ( value : IN supply_net_type )  return bit;
     
    function get_supply_state ( value : IN supply_net_type ) return state;


    -- Unsupported 2.0 functions. 

    function set_scope( inst_path : STRING ) return Boolean;

    --function get_scope return STRING;

    function is_valid_handle( handle : in upf_object_handle ) return Boolean;

    function get_object( inst_path : STRING; qualifier : STRING := "" ) return upf_object_handle;

    function get_object_kind( handle : upf_object_handle ) return object_kind;

    function is_supply_kind ( handle : upf_object_handle ) return Boolean;

    function get_supply_state_from_handle ( handle : upf_object_handle ) return state;

    function get_supply_voltage_from_handle ( handle : upf_object_handle ) return REAL;

    function assign_supply_state( handle : upf_object_handle;
        state : state := OFF;
        voltage : REAL := 0.0; delay : TIME := 0 ns )
    return Boolean;

    function is_supply_full_on ( handle : upf_object_handle ) return Boolean;

    function is_supply_off ( handle : upf_object_handle ) return Boolean;

    function is_supply_partial_on ( handle : upf_object_handle ) return Boolean;

    function is_supply_undetermined ( handle : upf_object_handle ) return Boolean;

    function is_supply_equal ( handle : upf_object_handle; state : state; voltage : real ) return Boolean;

    function are_supplies_equivalent ( handle1 : upf_object_handle; handle2 : upf_object_handle ) return Boolean;

    function assign_supply2supply( destination : upf_object_handle;
        source : upf_object_handle;
        delay : TIME := 0 ns )
        return Boolean;

    function create_root_supply_driver (
        driver_name : STRING;
        parent : upf_object_handle )
    return upf_object_handle;

    function get_iterator_for_all_ps ( handle : upf_object_handle ) return upf_object_handle;

    function get_iterator_for_all_active_ps ( handle : upf_object_handle ) return upf_object_handle;

    function iterate( iterator : upf_object_handle ) return upf_object_handle;

    --function get_ps_name( power_state : upf_object_handle ) return STRING;

    function get_ps_kind( power_state : upf_object_handle ) return power_state_kind;

    function get_ps_simstate( power_state : upf_object_handle ) return power_state_simstate;

    function is_active( power_state : upf_object_handle ) return Boolean;

    function is_in ( handle : upf_object_handle; power_state : upf_object_handle ) return Boolean;

    function set_power_state( object : upf_object_handle;
        power_state : upf_object_handle;
        delay : TIME := 0 ns )
    return Boolean;

    function tie_hi ( supply_net : supply_net_type ) return std_logic;

    function tie_lo ( supply_net : supply_net_type ) return std_logic;




    ----------------------------------Built in functions------------------------------------------------
     
    attribute builtin_subprogram : string;
   
    function  get_supply_value_internal ( pad_name  : IN string)return supply_net_type ;
    attribute builtin_subprogram of get_supply_value_internal : function  is "upf_get_signal_value_vhd";
  
    function set_supply_value_internal ( pad_name   : IN string;
                                         supply_net : IN supply_net_type ) return boolean ;
    attribute builtin_subprogram of set_supply_value_internal : function  is "upf_set_signal_value_vhd";
     
    function get_partial_on_translation_internal return boolean;
    attribute builtin_subprogram of get_partial_on_translation_internal : function  is "upf_get_partial_on_translation";

    
    -- unsupported 2.0 functions
    function set_scope_internal ( inst_path : IN string) return boolean;
    attribute builtin_subprogram of set_scope : function is "upf_set_scope_vhd";

    --function get_scope_internal return STRING;
    --attribute builtin_subprogram of get_scope : function is "upf_get_scope_vhd";

    function is_valid_handle_internal( handle : in upf_object_handle ) return Boolean;
    attribute builtin_subprogram of is_valid_handle : function is "upf_is_valid_handle_vhd";

    function get_object_internal( inst_path : STRING; qualifier : STRING := "" ) return upf_object_handle;
    attribute builtin_subprogram of get_object : function is "upf_get_object_vhd";

    function get_object_kind_internal( handle : upf_object_handle ) return object_kind;
    attribute builtin_subprogram of get_object_kind : function is "upf_get_object_kind_vhd";

    function is_supply_kind_internal ( handle : upf_object_handle ) return Boolean;
    attribute builtin_subprogram of is_supply_kind : function is "upf_is_supply_kind_vhd";

    function get_supply_state_from_handle_internal( handle : upf_object_handle ) return state;
    attribute builtin_subprogram of get_supply_state_from_handle : function is "upf_get_supply_state_from_handle_vhd";

    function get_supply_voltage_from_handle_internal( handle : upf_object_handle ) return REAL;
    attribute builtin_subprogram of get_supply_voltage_from_handle : function is "upf_get_supply_voltage_from_handle_vhd";

    function assign_supply_state_internal( handle : upf_object_handle;
        state : state := OFF;
        voltage : REAL := 0.0;
        delay : TIME := 0 ns )
    return Boolean;
    attribute builtin_subprogram of assign_supply_state : function is "upf_assign_supply_state_vhd";

    function is_supply_full_on_internal ( handle : upf_object_handle ) return Boolean;
    attribute builtin_subprogram of is_supply_full_on : function is "upf_is_supply_full_on_vhd";

    function is_supply_off_internal ( handle : upf_object_handle ) return Boolean;
    attribute builtin_subprogram of is_supply_off : function is "upf_is_supply_off_vhd";

    function is_supply_partial_on_internal ( handle : upf_object_handle ) return Boolean;
    attribute builtin_subprogram of is_supply_partial_on : function is "upf_is_supply_partial_on_vhd";

    function is_supply_undetermined_internal ( handle : upf_object_handle ) return Boolean;
    attribute builtin_subprogram of is_supply_undetermined : function is "upf_is_supply_undetermined_vhd";

    function is_supply_equal_internal ( handle : upf_object_handle; state : state; voltage : real ) return Boolean;
    attribute builtin_subprogram of is_supply_equal : function is "upf_is_supply_equal_vhd";

    function are_supplies_equivalent_internal ( handle1 : upf_object_handle; handle2 : upf_object_handle ) return Boolean;
    attribute builtin_subprogram of are_supplies_equivalent : function is "upf_are_supplies_equivalent_vhd";

    function assign_supply2supply_internal( destination : upf_object_handle;
        source : upf_object_handle;
        delay : TIME := 0 ns )
        return Boolean;
    attribute builtin_subprogram of assign_supply2supply : function is "upf_assign_supply2supply_vhd";

    function create_root_supply_driver_internal (
        driver_name : STRING;
        parent : upf_object_handle )
    return upf_object_handle;
    attribute builtin_subprogram of create_root_supply_driver : function is "upf_create_root_supply_driver_vhd";

    function get_iterator_for_all_ps_internal ( handle : upf_object_handle ) return upf_object_handle;
    attribute builtin_subprogram of get_iterator_for_all_ps : function is "upf_get_iterator_for_all_ps_vhd";

    function get_iterator_for_all_active_ps_internal ( handle : upf_object_handle ) return upf_object_handle;
    attribute builtin_subprogram of get_iterator_for_all_active_ps : function is "upf_get_iterator_for_all_active_ps_vhd";

    function iterate_internal( iterator : upf_object_handle ) return upf_object_handle;
    attribute builtin_subprogram of iterate : function is "upf_iterate_vhd";

    --function get_ps_name_internal( power_state : upf_object_handle ) return STRING;
    --attribute builtin_subprogram of get_ps_name : function is "upf_get_ps_name_vhd";

    function get_ps_kind_internal( power_state : upf_object_handle ) return power_state_kind;
    attribute builtin_subprogram of get_ps_kind : function is "upf_get_ps_kind_vhd";

    function get_ps_simstate_internal( power_state : upf_object_handle ) return power_state_simstate;
    attribute builtin_subprogram of get_ps_simstate : function is "upf_get_ps_simstate_vhd";

    function is_active_internal( power_state : upf_object_handle ) return Boolean;
    attribute builtin_subprogram of is_active : function is "upf_is_active_vhd";

    function is_in_internal ( handle : upf_object_handle; power_state : upf_object_handle ) return Boolean;
    attribute builtin_subprogram of is_in : function is "upf_is_in_vhd";

    function set_power_state_internal( object : upf_object_handle;
        power_state : upf_object_handle;
        delay : TIME := 0 ns )
    return Boolean;
    attribute builtin_subprogram of set_power_state : function is "upf_set_power_state_vhd";

    function tie_hi_internal ( supply_net : supply_net_type ) return std_logic;
    attribute builtin_subprogram of tie_hi : function is "upf_tie_hi_vhd";

    function tie_lo_internal ( supply_net : supply_net_type ) return std_logic;
    attribute builtin_subprogram of tie_lo : function is "upf_tie_lo_vhd";

    -------------------------------Built in functions for UPF 3.0---------------------------------------
    impure function upf_get_handle_by_name_internal (
        pathname : upfStringT;
        relative_to : upfHandleT := 0) return upfHandleT;
    attribute builtin_subprogram of upf_get_handle_by_name : function is "upf_get_handle_by_name_vhd";

    impure function upf_query_object_properties_internal (
        object_handle : upfHandleT;
        prop : upfPropertyIdE) return upfHandleT;
    attribute builtin_subprogram of upf_query_object_properties : function is "upf_query_object_properties_vhd";

    impure function upf_iter_get_next_internal (
        iter_handle : upfIteratorT) return upfHandleT;
    attribute builtin_subprogram of upf_iter_get_next : function is "upf_iter_get_next_vhd";

    impure function upf_get_value_str_internal (
        prop : upfHandleT) return upfStringT; 
    attribute builtin_subprogram of upf_get_value_str : function is "upf_get_value_str_vhd";

    impure function upf_get_value_int_internal (
        prop : upfHandleT) return upfIntegerT;
    attribute builtin_subprogram of upf_get_value_int : function is "upf_get_value_int_vhd";

    impure function upf_get_value_real_internal (
        prop : upfHandleT) return upfRealT;
    attribute builtin_subprogram of upf_get_value_real : function is "upf_get_value_real_vhd";

    impure function upf_get_label_upfSupplyTypeT_internal (
        prop : upfHandleT) return upfSupplyTypeT;
    attribute builtin_subprogram of upf_get_label_upfSupplyTypeT : function is "upf_get_label_upfSupplyTypeT_vhd";

    impure function upf_set_value_int_internal (
        prop : upfHandleT;
        value : upfIntegerT) return upfBooleanT;
    attribute builtin_subprogram of upf_set_value_int : function is "upf_set_value_int_vhd";

    impure function upf_set_value_upfSupplyTypeT_internal (
        prop : upfHandleT;
        value : upfSupplyTypeT) return upfBooleanT; 
    attribute builtin_subprogram of upf_set_value_upfSupplyTypeT : function is "upf_set_value_upfSupplyTypeT_vhd";


    impure function set_supply_state_internal (
        object_name : upfStringT;
        supply_state : upfSupplyStateE) return upfBooleanT;
    attribute builtin_subprogram of set_supply_state : function is "set_supply_state_vhd";

    impure function set_power_state_by_handle_internal (
        object : upfHandleT;
        power_state : upfHandleT) return upfBooleanT;
    attribute builtin_subprogram of set_power_state_by_handle : function is "set_power_state_by_handle_vhd";

    impure function upf_create_object_mirror_internal (
        src : UpfStringT;
        dst : UpfStringT) return upfBooleanT ;
    attribute builtin_subprogram of upf_create_object_mirror : function is "upf_create_object_mirror_vhd";

    impure function upf_query_object_type_internal (
        handle : upfHandleT) return upfClassIdE;
    attribute builtin_subprogram of upf_query_object_type : function is "upf_query_object_type_vhd";

    impure function upf_object_in_class_internal (
        handle : upfHandleT;
        class_id : upfClassIdE) return upfBooleanT;
    attribute builtin_subprogram of upf_object_in_class : function is "upf_object_in_class_vhd";

    impure function upf_query_object_pathname_internal (
        object : upfHandleT;
        relative_to : upfHandleT := 0) return upfStringT;
    attribute builtin_subprogram of upf_query_object_pathname : function is "upf_query_object_pathname_vhd";

    impure function upf_convert_real_volts_to_int_uvolts_internal (
        volt : upfRealT) return upfIntegerT;
    attribute builtin_subprogram of upf_convert_real_volts_to_int_uvolts : function is "upf_convert_real_volts_to_int_uvolts_vhd";

    impure function upf_convert_int_uvolts_to_real_volts_internal (
        uvolt : upfIntegerT) return upfRealT;
    attribute builtin_subprogram of upf_convert_int_uvolts_to_real_volts : function is "upf_convert_int_uvolts_to_real_volts_vhd";

    impure function one_hot_internal (
        sources: upfSupplyTypeVectorT) return upfSupplyTypeT;
    attribute builtin_subprogram of one_hot : function is "one_hot_vhd";

    impure function parallel_internal (
        sources: upfSupplyTypeVectorT) return upfSupplyTypeT;
    attribute builtin_subprogram of parallel : function is "parallel_vhd";

    impure function parallel_one_hot_internal (
        sources: upfSupplyTypeVectorT) return upfSupplyTypeT;
    attribute builtin_subprogram of parallel_one_hot : function is "parallel_one_hot_vhd";
    ----------------------------------------------------------------------------------------------------

end package ;

package body UPF is
    

    function supply_on (pad_name : IN string ; value : IN real ) return boolean is
    variable retval : boolean;
    constant factor : real := volt_to_uvolt;
    variable supply_net : supply_net_type;
    begin
        supply_net.voltage := to_signed(integer(value * factor),32);
        supply_net.state := FULL_ON;
        retval := set_supply_value_internal(pad_name, supply_net );
        return retval; 
    end;

    function supply_off (pad_name : IN string ) return boolean is
    variable retval : boolean;
    variable supply_net : supply_net_type;
    begin
        supply_net.voltage := to_signed(0,32);
        supply_net.state := OFF;
        retval := set_supply_value_internal(pad_name,supply_net );
        return retval; 
    end;

    function supply_partial_on (pad_name : string; value : real ) return boolean is
    variable retval : boolean;
    constant factor : real := volt_to_uvolt;
    variable supply_net : supply_net_type;
    begin
        supply_net.voltage := to_signed(integer(value * factor ), 32);
        supply_net.state := PARTIAL_ON;
        retval := set_supply_value_internal(pad_name,supply_net );
        return retval; 
    end;

    function get_supply_value ( pad_name    : IN string) return supply_net_type is
    variable supply : supply_net_type;
    begin
        supply := get_supply_value_internal(pad_name);
        return supply;
    end;

    function get_supply_voltage (value : supply_net_type ) return real is
    constant factor : real := volt_to_uvolt;
    variable voltage : real;
    begin
       voltage := real(to_integer(value.voltage)) / factor ;
       return voltage;
    end;

    function get_supply_state (value : supply_net_type ) return state is
    variable retstate : state;
    begin
       return value.state;
    end;

    function get_supply_on_state (value : IN supply_net_type )  return boolean is
    begin
        if (value.state = OFF) then
            return false;
        elsif (value.state = FULL_ON) then
            return true;
        elsif (value.state = UNDETERMINED) then
            return false;
        elsif (value.state = PARTIAL_ON) then
            if (get_partial_on_translation_internal) then
                return true;
            else
                return false;
            end if;
        else 
            return false;
        end if;
    end;

    function get_supply_on_state (value : IN supply_net_type )  return bit is
    begin
        if (value.state = OFF) then
            return '0';
        elsif (value.state = FULL_ON) then
            return '1';
        elsif (value.state = UNDETERMINED) then
            return '0';
        elsif (value.state = PARTIAL_ON) then
            if (get_partial_on_translation_internal) then
                return '1';
            else
                return '0';
            end if;
        else 
            return '0';
        end if;
    end;

    function  get_supply_value_internal( pad_name  : IN string) return  supply_net_type is
    variable supply :supply_net_type;
    begin
        assert false
        report "ERROR: builtin function IEEE.UPF.get_supply_value_internal not called"
        severity note;
        return supply;
    end;
                                           
    function  set_supply_value_internal ( pad_name   : IN string;
                                          supply_net : IN supply_net_type ) return boolean is
    constant value : boolean := false;
    begin
        assert false
        report "ERROR: builtin function IEEE.UPF.set_supply_value_internal not called"
        severity note;
        return value;
    end;

    function  get_partial_on_translation_internal return boolean is
    constant value : boolean := false;
    begin
        assert false
        report "ERROR: builtin function IEEE.UPF.get_partial_on_translation_internal not called"
        severity note;
        return value;
    end;


    -- Unsupported 2.0 functions
    function set_scope( inst_path : STRING ) return Boolean is
    variable ret_val: Boolean;
    begin
        ret_val := set_scope_internal (inst_path);
        return ret_val;
    end;

    function set_scope_internal( inst_path : STRING ) return Boolean is
    constant value : Boolean := false;
    begin
        assert false
        report "ERROR: builtin function IEEE.UPF.set_scope_internal not called"
        severity note;
        return value;
    end;


    -- Commenting this function as this will possibly be changed in LRM
    --function get_scope return STRING is
    --begin
    --    return get_scope_internal;
    --end;

    --function get_scope_internal return STRING is
    --constant value : STRING (1 downto 1):= " ";
    --begin
    --    assert false
    --    report "ERROR: builtin function IEEE.UPF.get_scope_internal not called"
    --    severity note;
    --    return value;
    --end;

    function is_valid_handle( handle : in upf_object_handle ) return Boolean is
    variable ret_val : Boolean;
    begin 
        ret_val := is_valid_handle_internal (handle);
        return ret_val;
    end;
    
    function is_valid_handle_internal (handle : in upf_object_handle) return Boolean is
    constant value : Boolean := false;
    begin
        assert false
        report "ERROR: builtin function IEEE.UPF.is_valid_handle not called"
        severity note;
        return value;
    end;

    function get_object( inst_path : STRING; qualifier : STRING := "" ) return upf_object_handle is
    variable ret_val : upf_object_handle;
    begin 
        ret_val := get_object_internal (inst_path, qualifier);
        return ret_val;
    end;

    function get_object_internal ( inst_path : STRING; qualifier : STRING := "" ) return upf_object_handle is
    constant value : upf_object_handle := 0;
    begin
        assert false
        report "ERROR: builtin function IEEE.UPF.get_object not called"
        severity note;
        return value;
    end;

    function get_object_kind( handle : upf_object_handle ) return object_kind is
    variable ret_val : object_kind;
    begin 
        ret_val := get_object_kind_internal (handle);
        return ret_val;
    end;

    function get_object_kind_internal ( handle : upf_object_handle ) return object_kind is
    constant value : object_kind := ERROR_KIND;
    begin
        assert false
        report "ERROR: builtin function IEEE.UPF.get_object_kind not called"
        severity note;
        return value;
    end;

    function is_supply_kind ( handle : upf_object_handle ) return Boolean is
    variable ret_val : Boolean := false;
    begin 
        ret_val := is_supply_kind_internal (handle);
        return ret_val;
    end;

    function is_supply_kind_internal ( handle : upf_object_handle ) return Boolean is
    constant value : Boolean := false;
    begin
        assert false
        report "ERROR: builtin function IEEE.UPF.is_supply_kind not called"
        severity note;
        return value;
    end;

    function get_supply_state_from_handle ( handle : upf_object_handle ) return state is
    variable ret_val : state := UNDETERMINED;
    begin 
        ret_val := get_supply_state_from_handle_internal (handle);
        return ret_val;
    end;

    function get_supply_state_from_handle_internal ( handle : upf_object_handle ) return state is
    constant value : state := UNDETERMINED;
    begin
        assert false
        report "ERROR: builtin function IEEE.UPF.get_supply_state_from_handle not called"
        severity note;
        return value;
    end;

    function get_supply_voltage_from_handle ( handle : upf_object_handle ) return REAL is
    variable ret_val : REAL := 0.0;
    begin 
        ret_val := get_supply_voltage_from_handle_internal (handle);
        return ret_val;
    end;

    function get_supply_voltage_from_handle_internal ( handle : upf_object_handle ) return REAL is
    constant value : REAL := 0.0;
    begin
        assert false
        report "ERROR: builtin function IEEE.UPF.get_supply_voltage_from_handle not called"
        severity note;
        return value;
    end;

    function assign_supply_state ( handle : upf_object_handle;
        state : state := OFF;
        voltage : REAL := 0.0;
        delay : TIME := 0 ns )
    return Boolean is
    variable ret_val : Boolean := false;
    begin 
        ret_val := assign_supply_state_internal (handle, state, voltage, delay);
        return ret_val;
    end;

    function assign_supply_state_internal ( handle : upf_object_handle;
        state : state := OFF;
        voltage : REAL := 0.0;
        delay : TIME := 0 ns )
    return Boolean is
    constant value : Boolean := false;
    begin
        assert false
        report "ERROR: builtin function IEEE.UPF.assign_supply_state not called"
        severity note;
        return value;
    end;

    function is_supply_full_on ( handle : upf_object_handle ) return Boolean is
    variable ret_val : Boolean := false;
    begin 
        ret_val := is_supply_full_on (handle);
        return ret_val;
    end;

    function is_supply_full_on_internal ( handle : upf_object_handle ) return Boolean is
    constant value : Boolean := false;
    begin
        assert false
        report "ERROR: builtin function IEEE.UPF.is_supply_full_on not called"
        severity note;
        return value;
    end;

    function is_supply_off ( handle : upf_object_handle ) return Boolean is
    variable ret_val : Boolean := false;
    begin 
        ret_val := is_supply_off (handle);
        return ret_val;
    end;

    function is_supply_off_internal ( handle : upf_object_handle ) return Boolean is
    constant value : Boolean := false;
    begin
        assert false
        report "ERROR: builtin function IEEE.UPF.is_supply_off not called"
        severity note;
        return value;
    end;

    function is_supply_partial_on ( handle : upf_object_handle ) return Boolean is
    variable ret_val : Boolean := false;
    begin 
        ret_val := is_supply_partial_on_internal (handle);
        return ret_val;
    end;

    function is_supply_partial_on_internal ( handle : upf_object_handle ) return Boolean is
    constant value : Boolean := false;
    begin
        assert false
        report "ERROR: builtin function IEEE.UPF.is_supply_partial_on not called"
        severity note;
        return value;
    end;

    function is_supply_undetermined ( handle : upf_object_handle ) return Boolean is
    variable ret_val : Boolean := false;
    begin 
        ret_val := is_supply_undetermined_internal (handle);
        return ret_val;
    end;

    function is_supply_undetermined_internal ( handle : upf_object_handle ) return Boolean is
    constant value : Boolean := false;
    begin
        assert false
        report "ERROR: builtin function IEEE.UPF.is_supply_undetermined not called"
        severity note;
        return value;
    end;

    function is_supply_equal ( handle : upf_object_handle; state : state; voltage : real ) return Boolean is
    variable ret_val : Boolean := false;
    begin 
        ret_val := is_supply_equal_internal (handle, state, voltage);
        return ret_val;
    end;

    function is_supply_equal_internal ( handle : upf_object_handle; state : state; voltage : real ) return Boolean is
    constant value : Boolean := false;
    begin
        assert false
        report "ERROR: builtin function IEEE.UPF.is_supply_equal not called"
        severity note;
        return value;
    end;

    function are_supplies_equivalent ( handle1 : upf_object_handle; handle2 : upf_object_handle ) return Boolean is
    variable ret_val : Boolean := false;
    begin 
        ret_val := are_supplies_equivalent_internal (handle1, handle2);
        return ret_val;
    end;

    function are_supplies_equivalent_internal ( handle1 : upf_object_handle; handle2 : upf_object_handle ) return Boolean is
    constant value : Boolean := false;
    begin
        assert false
        report "ERROR: builtin function IEEE.UPF.are_supplies_equivalent not called"
        severity note;
        return value;
    end;

    function assign_supply2supply( destination : upf_object_handle;
        source : upf_object_handle;
        delay : TIME := 0 ns )
        return Boolean is
    variable ret_val : Boolean := false;
    begin 
        ret_val := assign_supply2supply_internal (destination, source, delay);
        return ret_val;
    end;

    function assign_supply2supply_internal ( destination : upf_object_handle;
        source : upf_object_handle;
        delay : TIME := 0 ns )
    return Boolean is
    constant value : Boolean := false;
    begin
        assert false
        report "ERROR: builtin function IEEE.UPF.assign_supply2supply not called"
        severity note;
        return value;
    end;

    function create_root_supply_driver (
        driver_name : STRING;
        parent : upf_object_handle )
    return upf_object_handle is
    variable ret_val : upf_object_handle;
    begin 
        ret_val := create_root_supply_driver_internal (driver_name, parent);
        return ret_val;
    end;

    function create_root_supply_driver_internal (
        driver_name : STRING;
        parent : upf_object_handle )
    return upf_object_handle is
    constant value : upf_object_handle := 0;
    begin
        assert false
        report "ERROR: builtin function IEEE.UPF.create_root_supply_driver not called"
        severity note;
        return value;
    end;

    function get_iterator_for_all_ps ( handle : upf_object_handle ) return upf_object_handle is
    variable ret_val : upf_object_handle := 0;
    begin 
        ret_val := get_iterator_for_all_ps_internal (handle);
        return ret_val;
    end;

    function get_iterator_for_all_ps_internal ( handle : upf_object_handle ) return upf_object_handle is
    constant value : upf_object_handle := 0;
    begin
        assert false
        report "ERROR: builtin function IEEE.UPF.get_iterator_for_all_ps not called"
        severity note;
        return value;
    end;

    function get_iterator_for_all_active_ps ( handle : upf_object_handle ) return upf_object_handle is
    variable ret_val : upf_object_handle := 0;
    begin 
        ret_val := get_iterator_for_all_active_ps_internal (handle);
        return ret_val;
    end;

    function get_iterator_for_all_active_ps_internal ( handle : upf_object_handle ) return upf_object_handle is
    constant value : upf_object_handle := 0;
    begin
        assert false
        report "ERROR: builtin function IEEE.UPF.get_iterator_for_all_active_ps not called"
        severity note;
        return value;
    end;

    function iterate( iterator : upf_object_handle ) return upf_object_handle is
    variable ret_val : upf_object_handle := 0;
    begin 
        ret_val := iterate_internal (iterator);
        return ret_val;
    end;

    function iterate_internal ( iterator : upf_object_handle ) return upf_object_handle is
    constant value : upf_object_handle := 0;
    begin
        assert false
        report "ERROR: builtin function IEEE.UPF.iterate not called"
        severity note;
        return value;
    end;

    -- Commenting this function as this will possibly be changed in LRM
    --function get_ps_name( power_state : upf_object_handle ) return STRING is
    --variable ret_val : STRING (1 downto 1) := " ";
    --begin 
    --    ret_val := get_ps_name_internal (power_state);
    --    return ret_val;
    --end;

    --function get_ps_name_internal ( power_state : upf_object_handle ) return STRING is
    --constant value : STRING (1 downto 1) := " ";
    --begin
    --    assert false
    --    report "ERROR: builtin function IEEE.UPF.get_ps_name not called"
    --    severity note;
    --    return value;
    --end;

    function get_ps_kind( power_state : upf_object_handle ) return power_state_kind is
    variable ret_val : power_state_kind;
    begin 
        ret_val := get_ps_kind_internal (power_state);
        return ret_val;
    end;

    function get_ps_kind_internal ( power_state : upf_object_handle ) return power_state_kind is
    constant value : power_state_kind := ERROR_PS;
    begin
        assert false
        report "ERROR: builtin function IEEE.UPF.get_ps_kind not called"
        severity note;
        return value;
    end;

    function get_ps_simstate( power_state : upf_object_handle ) return power_state_simstate is
    variable ret_val : power_state_simstate := NORMAL;
    begin 
        ret_val := get_ps_simstate_internal (power_state);
        return ret_val;
    end;

    function get_ps_simstate_internal ( power_state : upf_object_handle ) return power_state_simstate is
    constant value : power_state_simstate := NORMAL;
    begin
        assert false
        report "ERROR: builtin function IEEE.UPF.get_ps_simstate not called"
        severity note;
        return value;
    end;

    function is_active( power_state : upf_object_handle ) return Boolean is
    variable ret_val : Boolean := false;
    begin 
        ret_val := is_active_internal (power_state);
        return ret_val;
    end;

    function is_active_internal ( power_state : upf_object_handle ) return Boolean is
    constant value : Boolean := false;
    begin
        assert false
        report "ERROR: builtin function IEEE.UPF.is_active_internal not called"
        severity note;
        return value;
    end;

    function is_in ( handle : upf_object_handle; power_state : upf_object_handle ) return Boolean is
    variable ret_val : Boolean := false;
    begin 
        ret_val := is_in_internal (handle, power_state);
        return ret_val;
    end;

    function is_in_internal ( handle : upf_object_handle; power_state : upf_object_handle ) return Boolean is
    constant value : Boolean := false;
    begin
        assert false
        report "ERROR: builtin function IEEE.UPF.is_in not called"
        severity note;
        return value;
    end;

    function set_power_state( object : upf_object_handle;
        power_state : upf_object_handle;
        delay : TIME := 0 ns )
    return Boolean is
    variable ret_val : Boolean := false;
    begin 
        ret_val := set_power_state_internal (object, power_state);
        return ret_val;
    end;

    function set_power_state_internal ( object : upf_object_handle; 
        power_state : upf_object_handle;
        delay : TIME := 0 ns )
    return Boolean is
    constant value : Boolean := false;
    begin
        assert false
        report "ERROR: builtin function IEEE.UPF.set_power_state not called"
        severity note;
        return value;
    end;

    function tie_hi ( supply_net : supply_net_type ) return std_logic is
    variable ret_val : std_logic := '0';
    begin 
        ret_val := tie_hi_internal (supply_net);
        return ret_val;
    end;

    function tie_hi_internal ( supply_net : supply_net_type ) return std_logic is
    constant value : std_logic := '0';
    begin
        assert false
        report "ERROR: builtin function IEEE.UPF.tie_hi not called"
        severity note;
        return value;
    end;

    function tie_lo ( supply_net : supply_net_type ) return std_logic is
    variable ret_val : std_logic;
    begin 
        ret_val := tie_lo_internal (supply_net);
        return ret_val;
    end;
   
    function tie_lo_internal ( supply_net : supply_net_type ) return std_logic is
    constant value : std_logic := '0';
    begin
        assert false
        report "ERROR: builtin function IEEE.UPF.tie_lo not called"
        severity note;
        return value;
    end;



--- UPF 3.0 package functions -------------
impure function upf_get_handle_by_name (
    -- A string representing handle ID for an object
    pathname : upfStringT;
    -- An optional handle to the object from which the relative
    -- pathname is given
    relative_to : upfHandleT := 0)
    -- Return Value: Returns the handle to the specified property or
    -- null if not found
    return upfHandleT is 
    variable ret_val : upfHandleT;
begin
    ret_val := upf_get_handle_by_name_internal (pathname, relative_to);
    return ret_val;
end;

impure function upf_get_handle_by_name_internal (
    pathname : upfStringT;
    relative_to : upfHandleT := 0) return upfHandleT is     
    constant value : upfHandleT := 0;
begin 
    assert false
    report "ERROR: builtin function IEEE.UPF.upf_get_handle_by_name not called"
    severity note;
    return value;
end;

impure function upf_query_object_properties (
    object_handle : upfHandleT;
    prop : upfPropertyIdE) return upfHandleT is
    variable ret_val : upfHandleT;
begin
    ret_val := upf_query_object_properties_internal(object_handle, prop);
    return ret_val;
end;

impure function upf_query_object_properties_internal (
    object_handle : upfHandleT;
    prop : upfPropertyIdE)  return upfHandleT is  
    constant value : upfHandleT := 0;
begin 
    assert false
    report "ERROR: builtin function IEEE.UPF.upf_query_object_properties not called"
    severity note;
    return value;
end;

impure function upf_iter_get_next (
    iter_handle : upfIteratorT)  return upfHandleT is 
    variable ret_val : upfHandleT;
begin
    ret_val := upf_iter_get_next_internal(iter_handle);
    return ret_val;
end;

impure function upf_iter_get_next_internal (
    iter_handle : upfIteratorT) return upfHandleT is
    constant value : upfHandleT := 0;
begin 
    assert false
    report "ERROR: builtin function IEEE.UPF.upf_iter_get_next not called"
    severity note;
    return value;
end;

impure function upf_get_value_str (
    prop : upfHandleT) return upfStringT is
    variable ret_val : upfStringT (4095 downto 1);
begin
    ret_val := upf_get_value_str_internal(prop);
    return ret_val;
end;

impure function upf_get_value_str_internal (
    prop : upfHandleT) return upfStringT is
    constant value : upfStringT := "";
begin 
    assert false
    report "ERROR: builtin function IEEE.UPF.upf_get_value_str not called"
    severity note;
    return value;
end;

impure function upf_get_value_int (
    prop : upfHandleT) return upfIntegerT is
    variable ret_val : upfIntegerT;
begin
    ret_val := upf_get_value_int_internal(prop);
    return ret_val;
end;

impure function upf_get_value_int_internal (
    prop : upfHandleT) return upfIntegerT is
    constant value : upfIntegerT := 0;
begin 
    assert false
    report "ERROR: builtin function IEEE.UPF.upf_get_value_int not called"
    severity note;
    return value;
end;

impure function upf_get_value_real (
    prop : upfHandleT) return upfRealT is
    variable ret_val : upfRealT;
begin
    ret_val := upf_get_value_real_internal(prop);
    return ret_val;
end;

impure function upf_get_value_real_internal (
    prop : upfHandleT) return upfRealT is
    constant value : upfRealT := 0.0;
begin 
    assert false
    report "ERROR: builtin function IEEE.UPF.upf_get_value_real not called"
    severity note;
    return value;
end;

impure function upf_get_label_upfSupplyTypeT (
    prop : upfHandleT) return upfSupplyTypeT is
    variable ret_val : upfSupplyTypeT;
begin
    ret_val := upf_get_label_upfSupplyTypeT_internal(prop);
    return ret_val;
end;

impure function upf_get_label_upfSupplyTypeT_internal (
    prop : upfHandleT) return upfSupplyTypeT is
    variable value : upfSupplyTypeT;
begin 
    assert false
    report "ERROR: builtin function IEEE.UPF.upf_get_label_upfSupplyTypeT not called"
    severity note;
    return value;
end;

impure function upf_set_value_int (
    prop : upfHandleT;
    value : upfIntegerT) return upfBooleanT is
    variable ret_val : upfBooleanT;
begin
    ret_val := upf_set_value_int_internal(prop, value);
    return ret_val;
end;

impure function upf_set_value_int_internal (
    prop : upfHandleT;
    value : upfIntegerT) return upfBooleanT is
    constant val : upfBooleanT := '0';
begin 
    assert false
    report "ERROR: builtin function IEEE.UPF.upf_set_value_int not called"
    severity note;
    return val;
end;

impure function upf_set_value_upfSupplyTypeT (
    prop : upfHandleT;
    value : upfSupplyTypeT) return upfBooleanT is
    variable ret_val : upfBooleanT;
begin
    ret_val := upf_set_value_upfSupplyTypeT_internal(prop, value);
    return ret_val;
end;

impure function upf_set_value_upfSupplyTypeT_internal (
    prop : upfHandleT;
    value : upfSupplyTypeT) return upfBooleanT is
    constant val : upfBooleanT := '0';
begin 
    assert false
    report "ERROR: builtin function IEEE.UPF.upf_set_value_upfSupplyTypeT not called"
    severity note;
    return val;
end;

impure function set_supply_state (
    object_name : upfStringT;
    supply_state : upfSupplyStateE) return upfBooleanT is
    variable ret_val : upfBooleanT;
begin
    ret_val := set_supply_state_internal(object_name, supply_state);
    return ret_val;
end;

impure function set_supply_state_internal (
    object_name : upfStringT;
    supply_state : upfSupplyStateE) return upfBooleanT is
    constant value : upfBooleanT := '0';
begin 
    assert false
    report "ERROR: builtin function IEEE.UPF.upf_set_value_int not called"
    severity note;
    return value;
end;

impure function set_power_state_by_handle (
    object : upfHandleT;
    power_state : upfHandleT) return upfBooleanT is
    variable ret_val : upfBooleanT;
begin
    ret_val := set_power_state_by_handle_internal(object, power_state);
    return ret_val;
end;

impure function set_power_state_by_handle_internal (
    object : upfHandleT;
    power_state : upfHandleT) return upfBooleanT is
    constant value : upfBooleanT := '0';
begin 
    assert false
    report "ERROR: builtin function IEEE.UPF.set_power_state_by_handle not called"
    severity note;
    return value;
end;

impure function upf_create_object_mirror (
    src : UpfStringT;
    dst : UpfStringT) return upfBooleanT is
    variable ret_val : upfBooleanT;
begin
    ret_val := upf_create_object_mirror_internal(src, dst);
    return ret_val;
end;


impure function upf_create_object_mirror_internal (
    src : UpfStringT;
    dst : UpfStringT) return upfBooleanT is
    constant value : upfBooleanT := '0';
begin 
    assert false
    report "ERROR: builtin function IEEE.UPF.upf_create_object_mirror not called"
    severity note;
    return value;
end;

impure function upf_query_object_type (
    handle : upfHandleT) return upfClassIdE is
    variable ret_val : upfClassIdE;
begin
    ret_val := upf_query_object_type_internal(handle);
    return ret_val;
end;

impure function upf_query_object_type_internal (
    handle : upfHandleT) return upfClassIdE is
    constant value : upfClassIdE := UPF_BASE;
begin 
    assert false
    report "ERROR: builtin function IEEE.UPF.upf_query_object_type not called"
    severity note;
    return value;
end;

impure function upf_object_in_class (
    handle : upfHandleT;
    class_id : upfClassIdE) return upfBooleanT is
    variable ret_val : upfBooleanT;
begin
    ret_val := upf_object_in_class_internal(handle, class_id);
    return ret_val;
end;

impure function upf_object_in_class_internal (
    handle : upfHandleT;
    class_id : upfClassIdE) return upfBooleanT is
    constant value : upfBooleanT := '0';
begin 
    assert false
    report "ERROR: builtin function IEEE.UPF.upf_object_in_class not called"
    severity note;
    return value;
end;

impure function upf_query_object_pathname (
    object : upfHandleT;
    relative_to : upfHandleT := 0) return upfStringT is
    variable ret_val : upfStringT (4095 downto 1);
begin
    ret_val := upf_query_object_pathname_internal(object);
    return ret_val;
end;

impure function upf_query_object_pathname_internal (
    object : upfHandleT;
    relative_to : upfHandleT := 0) return upfStringT is
    constant value : upfStringT := "";
begin 
    assert false
    report "ERROR: builtin function IEEE.UPF.upf_query_object_pathname not called"
    severity note;
    return value;
end;

impure function upf_convert_real_volts_to_int_uvolts (
    volt : upfRealT) return upfIntegerT is
    variable ret_val : upfIntegerT;
begin
    ret_val := upf_convert_real_volts_to_int_uvolts_internal(volt);
    return ret_val;
end;

impure function upf_convert_real_volts_to_int_uvolts_internal (
    volt : upfRealT) return upfIntegerT is
    constant value : upfIntegerT := 0;
begin 
    assert false
    report "ERROR: builtin function IEEE.UPF.upf_convert_real_volts_to_int_uvolts not called"
    severity note;
    return value;
end;

impure function upf_convert_int_uvolts_to_real_volts (
    uvolt : upfIntegerT) return upfRealT is
    variable ret_val : upfRealT;
begin
    ret_val := upf_convert_int_uvolts_to_real_volts_internal(uvolt);
    return ret_val;
end;

impure function upf_convert_int_uvolts_to_real_volts_internal (
    uvolt : upfIntegerT) return upfRealT is
    constant value : upfRealT := 0.0;
begin 
    assert false
    report "ERROR: builtin function IEEE.UPF.upf_convert_int_uvolts_to_real_volts not called"
    severity note;
    return value;
end;

impure function one_hot (
    sources: upfSupplyTypeVectorT) return upfSupplyTypeT is
    variable ret_val : upfSupplyTypeT;
begin
    ret_val := one_hot_internal(sources);
    return ret_val;
end;

impure function one_hot_internal (
    sources: upfSupplyTypeVectorT) return upfSupplyTypeT is
    variable value : upfSupplyTypeT;
begin 
    assert false
    report "ERROR: builtin function IEEE.UPF.one_hot not called"
    severity note;
    return value;
end;

impure function parallel (
    sources: upfSupplyTypeVectorT) return upfSupplyTypeT is
    variable ret_val : upfSupplyTypeT;
begin
    ret_val := parallel_internal(sources);
    return ret_val;
end;

impure function parallel_internal (
    sources: upfSupplyTypeVectorT) return upfSupplyTypeT is
    variable value : upfSupplyTypeT;
begin 
    assert false
    report "ERROR: builtin function IEEE.UPF.parallel not called"
    severity note;
    return value;
end;

impure function parallel_one_hot (
    sources: upfSupplyTypeVectorT) return upfSupplyTypeT is
    variable ret_val : upfSupplyTypeT;
begin
    ret_val := parallel_one_hot_internal(sources);
    return ret_val;
end;

impure function parallel_one_hot_internal (
    sources: upfSupplyTypeVectorT) return upfSupplyTypeT is
    variable value : upfSupplyTypeT;
begin 
    assert false
    report "ERROR: builtin function IEEE.UPF.parallel_one_hot not called"
    severity note;
    return value;
end;


end UPF;

