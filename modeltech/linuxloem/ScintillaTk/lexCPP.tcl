package provide LexCPP 1.0

namespace eval LexCPP {
    proc configure { sci } {
        $sci config -lang cpp

        set keywords0 "and and_eq asm auto bitand bitor bool break \
        case catch char class compl const const_cast continue \
        default delete do double dynamic_cast else enum explicit export extern false float for \
        friend goto if inline int long mutable namespace new not not_eq \
        operator or or_eq private protected public \
        register reinterpret_cast return short signed sizeof static static_cast struct switch \
        template this throw true try typedef typeid typename union unsigned using \
        virtual void volatile wchar_t while xor xor_eq"
        $sci keywords 0 $keywords0

        # define styles for syntax highlighting
        $sci style $ScintillaTk::SCE_C_COMMENT      -fg "#008000"
        $sci style $ScintillaTk::SCE_C_COMMENTLINE  -fg "#008000"
        $sci style $ScintillaTk::SCE_C_COMMENTDOC   -fg "#008000"
        $sci style $ScintillaTk::SCE_C_STRING       -fg "#008080"
        $sci style $ScintillaTk::SCE_C_PREPROCESSOR -fg "#404080"
        $sci style $ScintillaTk::SCE_C_OPERATOR     -fg "#000080"
        $sci style $ScintillaTk::SCE_C_IDENTIFIER   -fg "#C00000"
        $sci style $ScintillaTk::SCE_C_NUMBER       -fg "#9C20EF"
        $sci style $ScintillaTk::SCE_C_WORD         -fg "#0000FF"
        
        # style numbers for "dead" code use an offset of 64
        set DeadCodeOffset 64
        $sci style [expr {$ScintillaTk::SCE_C_COMMENT + $DeadCodeOffset}]      -fg "#808080" -bg "#E0E0E0" -eolfilled 1
        $sci style [expr {$ScintillaTk::SCE_C_COMMENTLINE + $DeadCodeOffset}]  -fg "#808080" -bg "#E0E0E0" -eolfilled 1
        $sci style [expr {$ScintillaTk::SCE_C_COMMENTDOC + $DeadCodeOffset}]   -fg "#808080" -bg "#E0E0E0" -eolfilled 1
        $sci style [expr {$ScintillaTk::SCE_C_STRING + $DeadCodeOffset}]       -fg "#808080" -bg "#E0E0E0" -eolfilled 1
        $sci style [expr {$ScintillaTk::SCE_C_PREPROCESSOR + $DeadCodeOffset}] -fg "#808080" -bg "#E0E0E0" -eolfilled 1
        $sci style [expr {$ScintillaTk::SCE_C_OPERATOR + $DeadCodeOffset}]     -fg "#808080" -bg "#E0E0E0" -eolfilled 1
        $sci style [expr {$ScintillaTk::SCE_C_IDENTIFIER + $DeadCodeOffset}]   -fg "#808080" -bg "#E0E0E0" -eolfilled 1
        $sci style [expr {$ScintillaTk::SCE_C_NUMBER + $DeadCodeOffset}]       -fg "#808080" -bg "#E0E0E0" -eolfilled 1
        $sci style [expr {$ScintillaTk::SCE_C_WORD + $DeadCodeOffset}]         -fg "#808080" -bg "#E0E0E0" -eolfilled 1
        
        # allows folding of "dead" code
        $sci property "fold.preprocessor" 1
    }
}


