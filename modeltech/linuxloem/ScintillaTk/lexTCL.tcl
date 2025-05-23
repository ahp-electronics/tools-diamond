package provide LexTCL 1.0

namespace eval LexTCL {
    proc configure { sci } {
        $sci config -lang tcl

        set keywords0 {
            after append array auto_execok auto_import auto_load auto_load_index
            auto_qualify beep bgerror binary break case catch cd clock close
            concat continue dde default echo else elseif encoding eof error eval
            exec exit expr fblocked fconfigure fcopy file fileevent flush for
            foreach format gets glob global history http if incr info interp join
            lappend lindex linsert list llength load loadTk lrange lreplace
            lsearch lset lsort memory msgcat namespace open package pid
            pkg::create pkg_mkIndex Platform-specific proc puts pwd re_syntax read
            regexp registry regsub rename resource return scan seek set socket
            source split string subst switch tclLog tclMacPkgSearch tclPkgSetup
            tclPkgUnknown tell time trace unknown unset update uplevel upvar
            variable vwait while
        }
        $sci keywords 0 $keywords0

        set keywords1 {
            bell bind bindtags bitmap button canvas checkbutton clipboard colors
            console cursors destroy entry event focus font frame grab grid image
            Inter-client keysyms label labelframe listbox lower menu menubutton
            message option options pack panedwindow photo place radiobutton raise
            scale scrollbar selection send spinbox text tk tk_chooseColor
            tk_chooseDirectory tk_dialog tk_focusNext tk_getOpenFile tk_messageBox
            tk_optionMenu tk_popup tk_setPalette tkerror tkvars tkwait toplevel
            winfo wish wm
        }
        $sci keywords 1 $keywords1

        set keywords2 {
            tk_bisque tk_chooseColor tk_dialog tk_focusFollowsMouse tk_focusNext
            tk_focusPrev tk_getOpenFile tk_getSaveFile tk_messageBox tk_optionMenu
            tk_popup tk_setPalette tk_textCopy tk_textCut tk_textPaste
            tkButtonAutoInvoke tkButtonDown tkButtonEnter tkButtonInvoke
            tkButtonLeave tkButtonUp tkCancelRepeat tkCheckRadioDown
            tkCheckRadioEnter tkCheckRadioInvoke tkColorDialog
            tkColorDialog_BuildDialog tkColorDialog_CancelCmd tkColorDialog_Config
            tkColorDialog_CreateSelector tkColorDialog_DrawColorScale
            tkColorDialog_EnterColorBar tkColorDialog_HandleRGBEntry
            tkColorDialog_HandleSelEntry tkColorDialog_InitValues
            tkColorDialog_LeaveColorBar tkColorDialog_MoveSelector
            tkColorDialog_OkCmd tkColorDialog_RedrawColorBars
            tkColorDialog_RedrawFinalColor tkColorDialog_ReleaseMouse
            tkColorDialog_ResizeColorBars tkColorDialog_RgbToX
            tkColorDialog_SetRGBValue tkColorDialog_StartMove tkColorDialog_XToRgb
            tkConsoleAbout tkConsoleBind tkConsoleExit tkConsoleHistory
            tkConsoleInit tkConsoleInsert tkConsoleInvoke tkConsoleOutput
            tkConsolePrompt tkConsoleSource tkDarken tkEntryAutoScan
            tkEntryBackspace tkEntryButton1 tkEntryClosestGap tkEntryGetSelection
            tkEntryInsert tkEntryKeySelect tkEntryMouseSelect tkEntryNextWord
            tkEntryPaste tkEntryPreviousWord tkEntrySeeInsert tkEntrySetCursor
            tkEntryTranspose tkEventMotifBindings tkFDGetFileTypes tkFirstMenu
            tkFocusGroup_BindIn tkFocusGroup_BindOut tkFocusGroup_Create
            tkFocusGroup_Destroy tkFocusGroup_In tkFocusGroup_Out tkFocusOK
            tkGenerateMenuSelect tkIconList tkIconList_Add tkIconList_Arrange
            tkIconList_AutoScan tkIconList_Btn1 tkIconList_Config
            tkIconList_Create tkIconList_CtrlBtn1 tkIconList_Curselection
            tkIconList_DeleteAll tkIconList_Double1 tkIconList_DrawSelection
            tkIconList_FocusIn tkIconList_FocusOut tkIconList_Get tkIconList_Goto
            tkIconList_Index tkIconList_Invoke tkIconList_KeyPress
            tkIconList_Leave1 tkIconList_LeftRight tkIconList_Motion1
            tkIconList_Reset tkIconList_ReturnKey tkIconList_See tkIconList_Select
            tkIconList_Selection tkIconList_ShiftBtn1 tkIconList_UpDown tkListbox
            tkListboxAutoScan tkListboxBeginExtend tkListboxBeginSelect
            tkListboxBeginToggle tkListboxCancel tkListboxDataExtend
            tkListboxExtendUpDown tkListboxKeyAccel_Goto tkListboxKeyAccel_Key
            tkListboxKeyAccel_Reset tkListboxKeyAccel_Set tkListboxKeyAccel_Unset
            tkListboxMotion tkListboxSelectAll tkListboxUpDown tkMbButtonUp
            tkMbEnter tkMbLeave tkMbMotion tkMbPost tkMenuButtonDown
            tkMenuDownArrow tkMenuDup tkMenuEscape tkMenuFind tkMenuFindName
            tkMenuFirstEntry tkMenuInvoke tkMenuLeave tkMenuLeftArrow tkMenuMotion
            tkMenuNextEntry tkMenuNextMenu tkMenuRightArrow tkMenuUnpost
            tkMenuUpArrow tkMessageBox tkMotifFDialog tkMotifFDialog_ActivateDList
            tkMotifFDialog_ActivateFEnt tkMotifFDialog_ActivateFList
            tkMotifFDialog_ActivateSEnt tkMotifFDialog_BrowseDList
            tkMotifFDialog_BrowseFList tkMotifFDialog_BuildUI
            tkMotifFDialog_CancelCmd tkMotifFDialog_Config tkMotifFDialog_Create
            tkMotifFDialog_FileTypes tkMotifFDialog_FilterCmd
            tkMotifFDialog_InterpFilter tkMotifFDialog_LoadFiles
            tkMotifFDialog_MakeSList tkMotifFDialog_OkCmd tkMotifFDialog_SetFilter
            tkMotifFDialog_SetListMode tkMotifFDialog_Update tkPostOverPoint
            tkRecolorTree tkRestoreOldGrab tkSaveGrabInfo tkScaleActivate
            tkScaleButton2Down tkScaleButtonDown tkScaleControlPress tkScaleDrag
            tkScaleEndDrag tkScaleIncrement tkScreenChanged tkScrollButton2Down
            tkScrollButtonDown tkScrollButtonDrag tkScrollButtonUp tkScrollByPages
            tkScrollByUnits tkScrollDrag tkScrollEndDrag tkScrollSelect
            tkScrollStartDrag tkScrollTopBottom tkScrollToPos tkTabToWindow
            tkTearOffMenu tkTextAutoScan tkTextButton1 tkTextClosestGap
            tkTextInsert tkTextKeyExtend tkTextKeySelect tkTextNextPara
            tkTextNextPos tkTextNextWord tkTextPaste tkTextPrevPara tkTextPrevPos
            tkTextPrevWord tkTextResetAnchor tkTextScrollPages tkTextSelectTo
            tkTextSetCursor tkTextTranspose tkTextUpDownLine tkTraverseToMenu
            tkTraverseWithinMenu
        }
        $sci keywords 2 $keywords2

        set keywords3 {
            @scope body class code common component configbody constructor define
            destructor hull import inherit itcl itk itk_component itk_initialize
            itk_interior itk_option iwidgets keep method private protected public
        }
        $sci keywords 3 $keywords3
        $sci keywords 4 {expand}

        # define styles for syntax highlighting
        $sci style $ScintillaTk::SCE_TCL_COMMENT -fg #AA4422
        $sci style $ScintillaTk::SCE_TCL_COMMENTLINE -fg #AA4422
        $sci style $ScintillaTk::SCE_TCL_COMMENT_BOX -fg #AA4422
        $sci style $ScintillaTk::SCE_TCL_BLOCK_COMMENT -fg #AA4422
        $sci style $ScintillaTk::SCE_TCL_WORD -fg #0000FF -bold 1
        $sci style $ScintillaTk::SCE_TCL_WORD2 -fg #0010FF -bold 1
        $sci style $ScintillaTk::SCE_TCL_WORD3 -fg #0020FF -bold 1
        
        $sci style $ScintillaTk::SCE_TCL_OPERATOR -fg #000000
        $sci style $ScintillaTk::SCE_TCL_NUMBER -fg #FF00FF
        $sci style $ScintillaTk::SCE_TCL_IN_QUOTE -fg #00AA00
        $sci style $ScintillaTk::SCE_TCL_IDENTIFIER -fg #000000
    }
}
