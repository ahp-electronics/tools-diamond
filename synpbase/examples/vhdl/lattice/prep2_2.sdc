# Request that the Port "SEL" use an IBT pad type
define_attribute SEL orca_padtype "IBT"
# Tell Foundary that register should be close to the pad for all bits of a bus
define_attribute {DATA0[7:0]} dout ""
# Assign pad type to 2 bits of an 8 bit bus
define_attribute {DATA1[3]} orca_padtype "IBT"
define_attribute {DATA1[7]} orca_padtype "IBT"
# Assign pad type to all bits of an 8 bit bus
define_attribute {DATA2[7:0]} orca_padtype "IBTPD"
