# constant values defined in Scintilla.iface to be used by TCL clients
namespace eval ScintillaTk {

# Define start of Scintilla messages to be greater than all Windows edit (EM_*) messages
# as many EM_ messages can be used although that use is deprecated.
set SCI_START 2000
set SCI_OPTIONAL_START 3000
set SCI_LEXER_START 4000

# Add text to the document at current position.
# fun void AddText(int length, string text)
set SCI_ADDTEXT 2001
set prototype(SCI_ADDTEXT) {void {int length, string text}}

# Add array of cells to document.
# fun void AddStyledText(int length, cells c)
set SCI_ADDSTYLEDTEXT 2002
set prototype(SCI_ADDSTYLEDTEXT) {void {int length, cells c}}

# Insert string at a position.
# fun void InsertText(position pos, string text)
set SCI_INSERTTEXT 2003
set prototype(SCI_INSERTTEXT) {void {position pos, string text}}

# Change the text that is being inserted in response to SC_MOD_INSERTCHECK
# fun void ChangeInsertion(int length, string text)
set SCI_CHANGEINSERTION 2672
set prototype(SCI_CHANGEINSERTION) {void {int length, string text}}

# Delete all text in the document.
# fun void ClearAll(,)
set SCI_CLEARALL 2004
set prototype(SCI_CLEARALL) {void ,}

# Delete a range of text in the document.
# fun void DeleteRange(position pos, int deleteLength)
set SCI_DELETERANGE 2645
set prototype(SCI_DELETERANGE) {void {position pos, int deleteLength}}

# Set all style bytes to 0, remove all folding information.
# fun void ClearDocumentStyle(,)
set SCI_CLEARDOCUMENTSTYLE 2005
set prototype(SCI_CLEARDOCUMENTSTYLE) {void ,}

# Returns the number of bytes in the document.
# get int GetLength(,)
set SCI_GETLENGTH 2006
set prototype(SCI_GETLENGTH) {int ,}

# Returns the character byte at the position.
# get int GetCharAt(position pos,)
set SCI_GETCHARAT 2007
set prototype(SCI_GETCHARAT) {int {position pos,}}

# Returns the position of the caret.
# get position GetCurrentPos(,)
set SCI_GETCURRENTPOS 2008
set prototype(SCI_GETCURRENTPOS) {position ,}

# Returns the position of the opposite end of the selection to the caret.
# get position GetAnchor(,)
set SCI_GETANCHOR 2009
set prototype(SCI_GETANCHOR) {position ,}

# Returns the style byte at the position.
# get int GetStyleAt(position pos,)
set SCI_GETSTYLEAT 2010
set prototype(SCI_GETSTYLEAT) {int {position pos,}}

# Redoes the next action on the undo history.
# fun void Redo(,)
set SCI_REDO 2011
set prototype(SCI_REDO) {void ,}

# Choose between collecting actions into the undo
# history and discarding them.
# set void SetUndoCollection(bool collectUndo,)
set SCI_SETUNDOCOLLECTION 2012
set prototype(SCI_SETUNDOCOLLECTION) {void {bool collectUndo,}}

# Select all the text in the document.
# fun void SelectAll(,)
set SCI_SELECTALL 2013
set prototype(SCI_SELECTALL) {void ,}

# Remember the current position in the undo history as the position
# at which the document was saved.
# fun void SetSavePoint(,)
set SCI_SETSAVEPOINT 2014
set prototype(SCI_SETSAVEPOINT) {void ,}

# Retrieve a buffer of cells.
# Returns the number of bytes in the buffer not including terminating NULs.
# fun int GetStyledText(, textrange tr)
set SCI_GETSTYLEDTEXT 2015
set prototype(SCI_GETSTYLEDTEXT) {int {, textrange tr}}

# Are there any redoable actions in the undo history?
# fun bool CanRedo(,)
set SCI_CANREDO 2016
set prototype(SCI_CANREDO) {bool ,}

# Retrieve the line number at which a particular marker is located.
# fun int MarkerLineFromHandle(int handle,)
set SCI_MARKERLINEFROMHANDLE 2017
set prototype(SCI_MARKERLINEFROMHANDLE) {int {int handle,}}

# Delete a marker.
# fun void MarkerDeleteHandle(int handle,)
set SCI_MARKERDELETEHANDLE 2018
set prototype(SCI_MARKERDELETEHANDLE) {void {int handle,}}

# Is undo history being collected?
# get bool GetUndoCollection(,)
set SCI_GETUNDOCOLLECTION 2019
set prototype(SCI_GETUNDOCOLLECTION) {bool ,}

lappend enums(WhiteSpace) SCWS_
set SCWS_INVISIBLE 0
set SCWS_VISIBLEALWAYS 1
set SCWS_VISIBLEAFTERINDENT 2
set SCWS_VISIBLEONLYININDENT 3

# Are white space characters currently visible?
# Returns one of SCWS_* constants.
# get int GetViewWS(,)
set SCI_GETVIEWWS 2020
set prototype(SCI_GETVIEWWS) {int ,}

# Make white space characters invisible, always visible or visible outside indentation.
# set void SetViewWS(int viewWS,)
set SCI_SETVIEWWS 2021
set prototype(SCI_SETVIEWWS) {void {int viewWS,}}

# Find the position from a point within the window.
# fun position PositionFromPoint(int x, int y)
set SCI_POSITIONFROMPOINT 2022
set prototype(SCI_POSITIONFROMPOINT) {position {int x, int y}}

# Find the position from a point within the window but return
# INVALID_POSITION if not close to text.
# fun position PositionFromPointClose(int x, int y)
set SCI_POSITIONFROMPOINTCLOSE 2023
set prototype(SCI_POSITIONFROMPOINTCLOSE) {position {int x, int y}}

# Set caret to start of a line and ensure it is visible.
# fun void GotoLine(int line,)
set SCI_GOTOLINE 2024
set prototype(SCI_GOTOLINE) {void {int line,}}

# Set caret to a position and ensure it is visible.
# fun void GotoPos(position pos,)
set SCI_GOTOPOS 2025
set prototype(SCI_GOTOPOS) {void {position pos,}}

# Set the selection anchor to a position. The anchor is the opposite
# end of the selection from the caret.
# set void SetAnchor(position posAnchor,)
set SCI_SETANCHOR 2026
set prototype(SCI_SETANCHOR) {void {position posAnchor,}}

# Retrieve the text of the line containing the caret.
# Returns the index of the caret on the line.
# Result is NUL-terminated.
# fun int GetCurLine(int length, stringresult text)
set SCI_GETCURLINE 2027
set prototype(SCI_GETCURLINE) {int {int length, stringresult text}}

# Retrieve the position of the last correctly styled character.
# get position GetEndStyled(,)
set SCI_GETENDSTYLED 2028
set prototype(SCI_GETENDSTYLED) {position ,}

lappend enums(EndOfLine) SC_EOL_
set SC_EOL_CRLF 0
set SC_EOL_CR 1
set SC_EOL_LF 2

# Convert all line endings in the document to one mode.
# fun void ConvertEOLs(int eolMode,)
set SCI_CONVERTEOLS 2029
set prototype(SCI_CONVERTEOLS) {void {int eolMode,}}

# Retrieve the current end of line mode - one of CRLF, CR, or LF.
# get int GetEOLMode(,)
set SCI_GETEOLMODE 2030
set prototype(SCI_GETEOLMODE) {int ,}

# Set the current end of line mode.
# set void SetEOLMode(int eolMode,)
set SCI_SETEOLMODE 2031
set prototype(SCI_SETEOLMODE) {void {int eolMode,}}

# Set the current styling position to pos and the styling mask to mask.
# The styling mask can be used to protect some bits in each styling byte from modification.
# fun void StartStyling(position pos, int mask)
set SCI_STARTSTYLING 2032
set prototype(SCI_STARTSTYLING) {void {position pos, int mask}}

# Change style from current styling position for length characters to a style
# and move the current styling position to after this newly styled segment.
# fun void SetStyling(int length, int style)
set SCI_SETSTYLING 2033
set prototype(SCI_SETSTYLING) {void {int length, int style}}

# Is drawing done first into a buffer or direct to the screen?
# get bool GetBufferedDraw(,)
set SCI_GETBUFFEREDDRAW 2034
set prototype(SCI_GETBUFFEREDDRAW) {bool ,}

# If drawing is buffered then each line of text is drawn into a bitmap buffer
# before drawing it to the screen to avoid flicker.
# set void SetBufferedDraw(bool buffered,)
set SCI_SETBUFFEREDDRAW 2035
set prototype(SCI_SETBUFFEREDDRAW) {void {bool buffered,}}

# Change the visible size of a tab to be a multiple of the width of a space character.
# set void SetTabWidth(int tabWidth,)
set SCI_SETTABWIDTH 2036
set prototype(SCI_SETTABWIDTH) {void {int tabWidth,}}

# Retrieve the visible size of a tab.
# get int GetTabWidth(,)
set SCI_GETTABWIDTH 2121
set prototype(SCI_GETTABWIDTH) {int ,}

# Clear explicit tabstops on a line.
# fun void ClearTabStops(int line,)
set SCI_CLEARTABSTOPS 2675
set prototype(SCI_CLEARTABSTOPS) {void {int line,}}

# Add an explicit tab stop for a line.
# fun void AddTabStop(int line, int x)
set SCI_ADDTABSTOP 2676
set prototype(SCI_ADDTABSTOP) {void {int line, int x}}

# Find the next explicit tab stop position on a line after a position.
# fun int GetNextTabStop(int line, int x)
set SCI_GETNEXTTABSTOP 2677
set prototype(SCI_GETNEXTTABSTOP) {int {int line, int x}}

# The SC_CP_UTF8 value can be used to enter Unicode mode.
# This is the same value as CP_UTF8 in Windows
set SC_CP_UTF8 65001

# Set the code page used to interpret the bytes of the document as characters.
# The SC_CP_UTF8 value can be used to enter Unicode mode.
# set void SetCodePage(int codePage,)
set SCI_SETCODEPAGE 2037
set prototype(SCI_SETCODEPAGE) {void {int codePage,}}

lappend enums(IMEInteraction) SC_IME_
set SC_IME_WINDOWED 0
set SC_IME_INLINE 1

# Is the IME displayed in a window or inline?
# get int GetIMEInteraction(,)
set SCI_GETIMEINTERACTION 2678
set prototype(SCI_GETIMEINTERACTION) {int ,}

# Choose to display the the IME in a winow or inline.
# set void SetIMEInteraction(int imeInteraction,)
set SCI_SETIMEINTERACTION 2679
set prototype(SCI_SETIMEINTERACTION) {void {int imeInteraction,}}

lappend enums(MarkerSymbol) SC_MARK_
set SC_MARK_CIRCLE 0
set SC_MARK_ROUNDRECT 1
set SC_MARK_ARROW 2
set SC_MARK_SMALLRECT 3
set SC_MARK_SHORTARROW 4
set SC_MARK_EMPTY 5
set SC_MARK_ARROWDOWN 6
set SC_MARK_MINUS 7
set SC_MARK_PLUS 8

# Shapes used for outlining column.
set SC_MARK_VLINE 9
set SC_MARK_LCORNER 10
set SC_MARK_TCORNER 11
set SC_MARK_BOXPLUS 12
set SC_MARK_BOXPLUSCONNECTED 13
set SC_MARK_BOXMINUS 14
set SC_MARK_BOXMINUSCONNECTED 15
set SC_MARK_LCORNERCURVE 16
set SC_MARK_TCORNERCURVE 17
set SC_MARK_CIRCLEPLUS 18
set SC_MARK_CIRCLEPLUSCONNECTED 19
set SC_MARK_CIRCLEMINUS 20
set SC_MARK_CIRCLEMINUSCONNECTED 21

# Invisible mark that only sets the line background colour.
set SC_MARK_BACKGROUND 22
set SC_MARK_DOTDOTDOT 23
set SC_MARK_ARROWS 24
set SC_MARK_PIXMAP 25
set SC_MARK_FULLRECT 26
set SC_MARK_LEFTRECT 27
set SC_MARK_AVAILABLE 28
set SC_MARK_UNDERLINE 29
set SC_MARK_RGBAIMAGE 30
set SC_MARK_BOOKMARK 31

set SC_MARK_CHARACTER 10000

lappend enums(MarkerOutline) SC_MARKNUM_
# Markers used for outlining column.
set SC_MARKNUM_FOLDEREND 25
set SC_MARKNUM_FOLDEROPENMID 26
set SC_MARKNUM_FOLDERMIDTAIL 27
set SC_MARKNUM_FOLDERTAIL 28
set SC_MARKNUM_FOLDERSUB 29
set SC_MARKNUM_FOLDER 30
set SC_MARKNUM_FOLDEROPEN 31

set SC_MASK_FOLDERS 0xFE000000UL

# Set the symbol used for a particular marker number.
# fun void MarkerDefine(int markerNumber, int markerSymbol)
set SCI_MARKERDEFINE 2040
set prototype(SCI_MARKERDEFINE) {void {int markerNumber, int markerSymbol}}

# Set the foreground colour used for a particular marker number.
# set void MarkerSetFore(int markerNumber, colour fore)
set SCI_MARKERSETFORE 2041
set prototype(SCI_MARKERSETFORE) {void {int markerNumber, colour fore}}

# Set the background colour used for a particular marker number.
# set void MarkerSetBack(int markerNumber, colour back)
set SCI_MARKERSETBACK 2042
set prototype(SCI_MARKERSETBACK) {void {int markerNumber, colour back}}

# Set the background colour used for a particular marker number when its folding block is selected.
# set void MarkerSetBackSelected(int markerNumber, colour back)
set SCI_MARKERSETBACKSELECTED 2292
set prototype(SCI_MARKERSETBACKSELECTED) {void {int markerNumber, colour back}}

# Enable/disable highlight for current folding bloc (smallest one that contains the caret)
# fun void MarkerEnableHighlight(bool enabled,)
set SCI_MARKERENABLEHIGHLIGHT 2293
set prototype(SCI_MARKERENABLEHIGHLIGHT) {void {bool enabled,}}

# Add a marker to a line, returning an ID which can be used to find or delete the marker.
# fun int MarkerAdd(int line, int markerNumber)
set SCI_MARKERADD 2043
set prototype(SCI_MARKERADD) {int {int line, int markerNumber}}

# Delete a marker from a line.
# fun void MarkerDelete(int line, int markerNumber)
set SCI_MARKERDELETE 2044
set prototype(SCI_MARKERDELETE) {void {int line, int markerNumber}}

# Delete all markers with a particular number from all lines.
# fun void MarkerDeleteAll(int markerNumber,)
set SCI_MARKERDELETEALL 2045
set prototype(SCI_MARKERDELETEALL) {void {int markerNumber,}}

# Get a bit mask of all the markers set on a line.
# fun int MarkerGet(int line,)
set SCI_MARKERGET 2046
set prototype(SCI_MARKERGET) {int {int line,}}

# Find the next line at or after lineStart that includes a marker in mask.
# Return -1 when no more lines.
# fun int MarkerNext(int lineStart, int markerMask)
set SCI_MARKERNEXT 2047
set prototype(SCI_MARKERNEXT) {int {int lineStart, int markerMask}}

# Find the previous line before lineStart that includes a marker in mask.
# fun int MarkerPrevious(int lineStart, int markerMask)
set SCI_MARKERPREVIOUS 2048
set prototype(SCI_MARKERPREVIOUS) {int {int lineStart, int markerMask}}

# Define a marker from a pixmap.
# fun void MarkerDefinePixmap(int markerNumber, string pixmap)
set SCI_MARKERDEFINEPIXMAP 2049
set prototype(SCI_MARKERDEFINEPIXMAP) {void {int markerNumber, string pixmap}}

# Add a set of markers to a line.
# fun void MarkerAddSet(int line, int set)
set SCI_MARKERADDSET 2466
set prototype(SCI_MARKERADDSET) {void {int line, int set}}

# Set the alpha used for a marker that is drawn in the text area, not the margin.
# set void MarkerSetAlpha(int markerNumber, int alpha)
set SCI_MARKERSETALPHA 2476
set prototype(SCI_MARKERSETALPHA) {void {int markerNumber, int alpha}}

set SC_MAX_MARGIN 4

lappend enums(MarginType) SC_MARGIN_
set SC_MARGIN_SYMBOL 0
set SC_MARGIN_NUMBER 1
set SC_MARGIN_BACK 2
set SC_MARGIN_FORE 3
set SC_MARGIN_TEXT 4
set SC_MARGIN_RTEXT 5

# Set a margin to be either numeric or symbolic.
# set void SetMarginTypeN(int margin, int marginType)
set SCI_SETMARGINTYPEN 2240
set prototype(SCI_SETMARGINTYPEN) {void {int margin, int marginType}}

# Retrieve the type of a margin.
# get int GetMarginTypeN(int margin,)
set SCI_GETMARGINTYPEN 2241
set prototype(SCI_GETMARGINTYPEN) {int {int margin,}}

# Set the width of a margin to a width expressed in pixels.
# set void SetMarginWidthN(int margin, int pixelWidth)
set SCI_SETMARGINWIDTHN 2242
set prototype(SCI_SETMARGINWIDTHN) {void {int margin, int pixelWidth}}

# Retrieve the width of a margin in pixels.
# get int GetMarginWidthN(int margin,)
set SCI_GETMARGINWIDTHN 2243
set prototype(SCI_GETMARGINWIDTHN) {int {int margin,}}

# Set a mask that determines which markers are displayed in a margin.
# set void SetMarginMaskN(int margin, int mask)
set SCI_SETMARGINMASKN 2244
set prototype(SCI_SETMARGINMASKN) {void {int margin, int mask}}

# Retrieve the marker mask of a margin.
# get int GetMarginMaskN(int margin,)
set SCI_GETMARGINMASKN 2245
set prototype(SCI_GETMARGINMASKN) {int {int margin,}}

# Make a margin sensitive or insensitive to mouse clicks.
# set void SetMarginSensitiveN(int margin, bool sensitive)
set SCI_SETMARGINSENSITIVEN 2246
set prototype(SCI_SETMARGINSENSITIVEN) {void {int margin, bool sensitive}}

# Retrieve the mouse click sensitivity of a margin.
# get bool GetMarginSensitiveN(int margin,)
set SCI_GETMARGINSENSITIVEN 2247
set prototype(SCI_GETMARGINSENSITIVEN) {bool {int margin,}}

# Set the cursor shown when the mouse is inside a margin.
# set void SetMarginCursorN(int margin, int cursor)
set SCI_SETMARGINCURSORN 2248
set prototype(SCI_SETMARGINCURSORN) {void {int margin, int cursor}}

# Retrieve the cursor shown in a margin.
# get int GetMarginCursorN(int margin,)
set SCI_GETMARGINCURSORN 2249
set prototype(SCI_GETMARGINCURSORN) {int {int margin,}}

# Styles in range 32..38 are predefined for parts of the UI and are not used as normal styles.
# Style 39 is for future use.
lappend enums(StylesCommon) STYLE_
set STYLE_DEFAULT 32
set STYLE_LINENUMBER 33
set STYLE_BRACELIGHT 34
set STYLE_BRACEBAD 35
set STYLE_CONTROLCHAR 36
set STYLE_INDENTGUIDE 37
set STYLE_CALLTIP 38
set STYLE_LASTPREDEFINED 39
set STYLE_MAX 255

# Character set identifiers are used in StyleSetCharacterSet.
# The values are the same as the Windows *_CHARSET values.
lappend enums(CharacterSet) SC_CHARSET_
set SC_CHARSET_ANSI 0
set SC_CHARSET_DEFAULT 1
set SC_CHARSET_BALTIC 186
set SC_CHARSET_CHINESEBIG5 136
set SC_CHARSET_EASTEUROPE 238
set SC_CHARSET_GB2312 134
set SC_CHARSET_GREEK 161
set SC_CHARSET_HANGUL 129
set SC_CHARSET_MAC 77
set SC_CHARSET_OEM 255
set SC_CHARSET_RUSSIAN 204
set SC_CHARSET_OEM866 866
set SC_CHARSET_CYRILLIC 1251
set SC_CHARSET_SHIFTJIS 128
set SC_CHARSET_SYMBOL 2
set SC_CHARSET_TURKISH 162
set SC_CHARSET_JOHAB 130
set SC_CHARSET_HEBREW 177
set SC_CHARSET_ARABIC 178
set SC_CHARSET_VIETNAMESE 163
set SC_CHARSET_THAI 222
set SC_CHARSET_8859_15 1000

# Clear all the styles and make equivalent to the global default style.
# fun void StyleClearAll(,)
set SCI_STYLECLEARALL 2050
set prototype(SCI_STYLECLEARALL) {void ,}

# Set the foreground colour of a style.
# set void StyleSetFore(int style, colour fore)
set SCI_STYLESETFORE 2051
set prototype(SCI_STYLESETFORE) {void {int style, colour fore}}

# Set the background colour of a style.
# set void StyleSetBack(int style, colour back)
set SCI_STYLESETBACK 2052
set prototype(SCI_STYLESETBACK) {void {int style, colour back}}

# Set a style to be bold or not.
# set void StyleSetBold(int style, bool bold)
set SCI_STYLESETBOLD 2053
set prototype(SCI_STYLESETBOLD) {void {int style, bool bold}}

# Set a style to be italic or not.
# set void StyleSetItalic(int style, bool italic)
set SCI_STYLESETITALIC 2054
set prototype(SCI_STYLESETITALIC) {void {int style, bool italic}}

# Set the size of characters of a style.
# set void StyleSetSize(int style, int sizePoints)
set SCI_STYLESETSIZE 2055
set prototype(SCI_STYLESETSIZE) {void {int style, int sizePoints}}

# Set the font of a style.
# set void StyleSetFont(int style, string fontName)
set SCI_STYLESETFONT 2056
set prototype(SCI_STYLESETFONT) {void {int style, string fontName}}

# Set a style to have its end of line filled or not.
# set void StyleSetEOLFilled(int style, bool filled)
set SCI_STYLESETEOLFILLED 2057
set prototype(SCI_STYLESETEOLFILLED) {void {int style, bool filled}}

# Reset the default style to its state at startup
# fun void StyleResetDefault(,)
set SCI_STYLERESETDEFAULT 2058
set prototype(SCI_STYLERESETDEFAULT) {void ,}

# Set a style to be underlined or not.
# set void StyleSetUnderline(int style, bool underline)
set SCI_STYLESETUNDERLINE 2059
set prototype(SCI_STYLESETUNDERLINE) {void {int style, bool underline}}

lappend enums(CaseVisible) SC_CASE_
set SC_CASE_MIXED 0
set SC_CASE_UPPER 1
set SC_CASE_LOWER 2
set SC_CASE_CAMEL 3

# Get the foreground colour of a style.
# get colour StyleGetFore(int style,)
set SCI_STYLEGETFORE 2481
set prototype(SCI_STYLEGETFORE) {colour {int style,}}

# Get the background colour of a style.
# get colour StyleGetBack(int style,)
set SCI_STYLEGETBACK 2482
set prototype(SCI_STYLEGETBACK) {colour {int style,}}

# Get is a style bold or not.
# get bool StyleGetBold(int style,)
set SCI_STYLEGETBOLD 2483
set prototype(SCI_STYLEGETBOLD) {bool {int style,}}

# Get is a style italic or not.
# get bool StyleGetItalic(int style,)
set SCI_STYLEGETITALIC 2484
set prototype(SCI_STYLEGETITALIC) {bool {int style,}}

# Get the size of characters of a style.
# get int StyleGetSize(int style,)
set SCI_STYLEGETSIZE 2485
set prototype(SCI_STYLEGETSIZE) {int {int style,}}

# Get the font of a style.
# Returns the length of the fontName
# Result is NUL-terminated.
# get int StyleGetFont(int style, stringresult fontName)
set SCI_STYLEGETFONT 2486
set prototype(SCI_STYLEGETFONT) {int {int style, stringresult fontName}}

# Get is a style to have its end of line filled or not.
# get bool StyleGetEOLFilled(int style,)
set SCI_STYLEGETEOLFILLED 2487
set prototype(SCI_STYLEGETEOLFILLED) {bool {int style,}}

# Get is a style underlined or not.
# get bool StyleGetUnderline(int style,)
set SCI_STYLEGETUNDERLINE 2488
set prototype(SCI_STYLEGETUNDERLINE) {bool {int style,}}

# Get is a style mixed case, or to force upper or lower case.
# get int StyleGetCase(int style,)
set SCI_STYLEGETCASE 2489
set prototype(SCI_STYLEGETCASE) {int {int style,}}

# Get the character get of the font in a style.
# get int StyleGetCharacterSet(int style,)
set SCI_STYLEGETCHARACTERSET 2490
set prototype(SCI_STYLEGETCHARACTERSET) {int {int style,}}

# Get is a style visible or not.
# get bool StyleGetVisible(int style,)
set SCI_STYLEGETVISIBLE 2491
set prototype(SCI_STYLEGETVISIBLE) {bool {int style,}}

# Get is a style changeable or not (read only).
# Experimental feature, currently buggy.
# get bool StyleGetChangeable(int style,)
set SCI_STYLEGETCHANGEABLE 2492
set prototype(SCI_STYLEGETCHANGEABLE) {bool {int style,}}

# Get is a style a hotspot or not.
# get bool StyleGetHotSpot(int style,)
set SCI_STYLEGETHOTSPOT 2493
set prototype(SCI_STYLEGETHOTSPOT) {bool {int style,}}

# Set a style to be mixed case, or to force upper or lower case.
# set void StyleSetCase(int style, int caseForce)
set SCI_STYLESETCASE 2060
set prototype(SCI_STYLESETCASE) {void {int style, int caseForce}}

set SC_FONT_SIZE_MULTIPLIER 100

# Set the size of characters of a style. Size is in points multiplied by 100.
# set void StyleSetSizeFractional(int style, int caseForce)
set SCI_STYLESETSIZEFRACTIONAL 2061
set prototype(SCI_STYLESETSIZEFRACTIONAL) {void {int style, int caseForce}}

# Get the size of characters of a style in points multiplied by 100
# get int StyleGetSizeFractional(int style,)
set SCI_STYLEGETSIZEFRACTIONAL 2062
set prototype(SCI_STYLEGETSIZEFRACTIONAL) {int {int style,}}

lappend enums(FontWeight) SC_WEIGHT_
set SC_WEIGHT_NORMAL 400
set SC_WEIGHT_SEMIBOLD 600
set SC_WEIGHT_BOLD 700

# Set the weight of characters of a style.
# set void StyleSetWeight(int style, int weight)
set SCI_STYLESETWEIGHT 2063
set prototype(SCI_STYLESETWEIGHT) {void {int style, int weight}}

# Get the weight of characters of a style.
# get int StyleGetWeight(int style,)
set SCI_STYLEGETWEIGHT 2064
set prototype(SCI_STYLEGETWEIGHT) {int {int style,}}

# Set the character set of the font in a style.
# set void StyleSetCharacterSet(int style, int characterSet)
set SCI_STYLESETCHARACTERSET 2066
set prototype(SCI_STYLESETCHARACTERSET) {void {int style, int characterSet}}

# Set a style to be a hotspot or not.
# set void StyleSetHotSpot(int style, bool hotspot)
set SCI_STYLESETHOTSPOT 2409
set prototype(SCI_STYLESETHOTSPOT) {void {int style, bool hotspot}}

# Set the foreground colour of the main and additional selections and whether to use this setting.
# fun void SetSelFore(bool useSetting, colour fore)
set SCI_SETSELFORE 2067
set prototype(SCI_SETSELFORE) {void {bool useSetting, colour fore}}

# Set the background colour of the main and additional selections and whether to use this setting.
# fun void SetSelBack(bool useSetting, colour back)
set SCI_SETSELBACK 2068
set prototype(SCI_SETSELBACK) {void {bool useSetting, colour back}}

# Get the alpha of the selection.
# get int GetSelAlpha(,)
set SCI_GETSELALPHA 2477
set prototype(SCI_GETSELALPHA) {int ,}

# Set the alpha of the selection.
# set void SetSelAlpha(int alpha,)
set SCI_SETSELALPHA 2478
set prototype(SCI_SETSELALPHA) {void {int alpha,}}

# Is the selection end of line filled?
# get bool GetSelEOLFilled(,)
set SCI_GETSELEOLFILLED 2479
set prototype(SCI_GETSELEOLFILLED) {bool ,}

# Set the selection to have its end of line filled or not.
# set void SetSelEOLFilled(bool filled,)
set SCI_SETSELEOLFILLED 2480
set prototype(SCI_SETSELEOLFILLED) {void {bool filled,}}

# Set the foreground colour of the caret.
# set void SetCaretFore(colour fore,)
set SCI_SETCARETFORE 2069
set prototype(SCI_SETCARETFORE) {void {colour fore,}}

# When key+modifier combination km is pressed perform msg.
# fun void AssignCmdKey(keymod km, int msg)
set SCI_ASSIGNCMDKEY 2070
set prototype(SCI_ASSIGNCMDKEY) {void {keymod km, int msg}}

# When key+modifier combination km is pressed do nothing.
# fun void ClearCmdKey(keymod km,)
set SCI_CLEARCMDKEY 2071
set prototype(SCI_CLEARCMDKEY) {void {keymod km,}}

# Drop all key mappings.
# fun void ClearAllCmdKeys(,)
set SCI_CLEARALLCMDKEYS 2072
set prototype(SCI_CLEARALLCMDKEYS) {void ,}

# Set the styles for a segment of the document.
# fun void SetStylingEx(int length, string styles)
set SCI_SETSTYLINGEX 2073
set prototype(SCI_SETSTYLINGEX) {void {int length, string styles}}

# Set a style to be visible or not.
# set void StyleSetVisible(int style, bool visible)
set SCI_STYLESETVISIBLE 2074
set prototype(SCI_STYLESETVISIBLE) {void {int style, bool visible}}

# Get the time in milliseconds that the caret is on and off.
# get int GetCaretPeriod(,)
set SCI_GETCARETPERIOD 2075
set prototype(SCI_GETCARETPERIOD) {int ,}

# Get the time in milliseconds that the caret is on and off. 0 = steady on.
# set void SetCaretPeriod(int periodMilliseconds,)
set SCI_SETCARETPERIOD 2076
set prototype(SCI_SETCARETPERIOD) {void {int periodMilliseconds,}}

# Set the set of characters making up words for when moving or selecting by word.
# First sets defaults like SetCharsDefault.
# set void SetWordChars(, string characters)
set SCI_SETWORDCHARS 2077
set prototype(SCI_SETWORDCHARS) {void {, string characters}}

# Get the set of characters making up words for when moving or selecting by word.
# Returns the number of characters
# get int GetWordChars(, stringresult characters)
set SCI_GETWORDCHARS 2646
set prototype(SCI_GETWORDCHARS) {int {, stringresult characters}}

# Start a sequence of actions that is undone and redone as a unit.
# May be nested.
# fun void BeginUndoAction(,)
set SCI_BEGINUNDOACTION 2078
set prototype(SCI_BEGINUNDOACTION) {void ,}

# End a sequence of actions that is undone and redone as a unit.
# fun void EndUndoAction(,)
set SCI_ENDUNDOACTION 2079
set prototype(SCI_ENDUNDOACTION) {void ,}

# Indicator style enumeration and some constants
lappend enums(IndicatorStyle) INDIC_
set INDIC_PLAIN 0
set INDIC_SQUIGGLE 1
set INDIC_TT 2
set INDIC_DIAGONAL 3
set INDIC_STRIKE 4
set INDIC_HIDDEN 5
set INDIC_BOX 6
set INDIC_ROUNDBOX 7
set INDIC_STRAIGHTBOX 8
set INDIC_DASH 9
set INDIC_DOTS 10
set INDIC_SQUIGGLELOW 11
set INDIC_DOTBOX 12
set INDIC_SQUIGGLEPIXMAP 13
set INDIC_COMPOSITIONTHICK 14
set INDIC_COMPOSITIONTHIN 15
set INDIC_FULLBOX 16
set INDIC_TEXTFORE 17
set INDIC_IME 65
set INDIC_IME_MAX 68
set INDIC_MAX 68
set INDIC_CONTAINER 8
set INDIC0_MASK 0x20
set INDIC1_MASK 0x40
set INDIC2_MASK 0x80
set INDICS_MASK 0xE0

# Set an indicator to plain, squiggle or TT.
# set void IndicSetStyle(int indic, int style)
set SCI_INDICSETSTYLE 2080
set prototype(SCI_INDICSETSTYLE) {void {int indic, int style}}

# Retrieve the style of an indicator.
# get int IndicGetStyle(int indic,)
set SCI_INDICGETSTYLE 2081
set prototype(SCI_INDICGETSTYLE) {int {int indic,}}

# Set the foreground colour of an indicator.
# set void IndicSetFore(int indic, colour fore)
set SCI_INDICSETFORE 2082
set prototype(SCI_INDICSETFORE) {void {int indic, colour fore}}

# Retrieve the foreground colour of an indicator.
# get colour IndicGetFore(int indic,)
set SCI_INDICGETFORE 2083
set prototype(SCI_INDICGETFORE) {colour {int indic,}}

# Set an indicator to draw under text or over(default).
# set void IndicSetUnder(int indic, bool under)
set SCI_INDICSETUNDER 2510
set prototype(SCI_INDICSETUNDER) {void {int indic, bool under}}

# Retrieve whether indicator drawn under or over text.
# get bool IndicGetUnder(int indic,)
set SCI_INDICGETUNDER 2511
set prototype(SCI_INDICGETUNDER) {bool {int indic,}}

# Set a hover indicator to plain, squiggle or TT.
# set void IndicSetHoverStyle(int indic, int style)
set SCI_INDICSETHOVERSTYLE 2680
set prototype(SCI_INDICSETHOVERSTYLE) {void {int indic, int style}}

# Retrieve the hover style of an indicator.
# get int IndicGetHoverStyle(int indic,)
set SCI_INDICGETHOVERSTYLE 2681
set prototype(SCI_INDICGETHOVERSTYLE) {int {int indic,}}

# Set the foreground hover colour of an indicator.
# set void IndicSetHoverFore(int indic, colour fore)
set SCI_INDICSETHOVERFORE 2682
set prototype(SCI_INDICSETHOVERFORE) {void {int indic, colour fore}}

# Retrieve the foreground hover colour of an indicator.
# get colour IndicGetHoverFore(int indic,)
set SCI_INDICGETHOVERFORE 2683
set prototype(SCI_INDICGETHOVERFORE) {colour {int indic,}}

set SC_INDICVALUEBIT 0x1000000
set SC_INDICVALUEMASK 0xFFFFFF

lappend enums(IndicFlag) SC_INDICFLAG_
set SC_INDICFLAG_VALUEFORE 1

# Set the attributes of an indicator.
# set void IndicSetFlags(int indic, int flags)
set SCI_INDICSETFLAGS 2684
set prototype(SCI_INDICSETFLAGS) {void {int indic, int flags}}

# Retrieve the attributes of an indicator.
# get int IndicGetFlags(int indic,)
set SCI_INDICGETFLAGS 2685
set prototype(SCI_INDICGETFLAGS) {int {int indic,}}

# Set the foreground colour of all whitespace and whether to use this setting.
# fun void SetWhitespaceFore(bool useSetting, colour fore)
set SCI_SETWHITESPACEFORE 2084
set prototype(SCI_SETWHITESPACEFORE) {void {bool useSetting, colour fore}}

# Set the background colour of all whitespace and whether to use this setting.
# fun void SetWhitespaceBack(bool useSetting, colour back)
set SCI_SETWHITESPACEBACK 2085
set prototype(SCI_SETWHITESPACEBACK) {void {bool useSetting, colour back}}

# Set the size of the dots used to mark space characters.
# set void SetWhitespaceSize(int size,)
set SCI_SETWHITESPACESIZE 2086
set prototype(SCI_SETWHITESPACESIZE) {void {int size,}}

# Get the size of the dots used to mark space characters.
# get int GetWhitespaceSize(,)
set SCI_GETWHITESPACESIZE 2087
set prototype(SCI_GETWHITESPACESIZE) {int ,}

# Divide each styling byte into lexical class bits (default: 5) and indicator
# bits (default: 3). If a lexer requires more than 32 lexical states, then this
# is used to expand the possible states.
# set void SetStyleBits(int bits,)
set SCI_SETSTYLEBITS 2090
set prototype(SCI_SETSTYLEBITS) {void {int bits,}}

# Retrieve number of bits in style bytes used to hold the lexical state.
# get int GetStyleBits(,)
set SCI_GETSTYLEBITS 2091
set prototype(SCI_GETSTYLEBITS) {int ,}

# Used to hold extra styling information for each line.
# set void SetLineState(int line, int state)
set SCI_SETLINESTATE 2092
set prototype(SCI_SETLINESTATE) {void {int line, int state}}

# Retrieve the extra styling information for a line.
# get int GetLineState(int line,)
set SCI_GETLINESTATE 2093
set prototype(SCI_GETLINESTATE) {int {int line,}}

# Retrieve the last line number that has line state.
# get int GetMaxLineState(,)
set SCI_GETMAXLINESTATE 2094
set prototype(SCI_GETMAXLINESTATE) {int ,}

# Is the background of the line containing the caret in a different colour?
# get bool GetCaretLineVisible(,)
set SCI_GETCARETLINEVISIBLE 2095
set prototype(SCI_GETCARETLINEVISIBLE) {bool ,}

# Display the background of the line containing the caret in a different colour.
# set void SetCaretLineVisible(bool show,)
set SCI_SETCARETLINEVISIBLE 2096
set prototype(SCI_SETCARETLINEVISIBLE) {void {bool show,}}

# Get the colour of the background of the line containing the caret.
# get colour GetCaretLineBack(,)
set SCI_GETCARETLINEBACK 2097
set prototype(SCI_GETCARETLINEBACK) {colour ,}

# Set the colour of the background of the line containing the caret.
# set void SetCaretLineBack(colour back,)
set SCI_SETCARETLINEBACK 2098
set prototype(SCI_SETCARETLINEBACK) {void {colour back,}}

# Set a style to be changeable or not (read only).
# Experimental feature, currently buggy.
# set void StyleSetChangeable(int style, bool changeable)
set SCI_STYLESETCHANGEABLE 2099
set prototype(SCI_STYLESETCHANGEABLE) {void {int style, bool changeable}}

# Display a auto-completion list.
# The lenEntered parameter indicates how many characters before
# the caret should be used to provide context.
# fun void AutoCShow(int lenEntered, string itemList)
set SCI_AUTOCSHOW 2100
set prototype(SCI_AUTOCSHOW) {void {int lenEntered, string itemList}}

# Remove the auto-completion list from the screen.
# fun void AutoCCancel(,)
set SCI_AUTOCCANCEL 2101
set prototype(SCI_AUTOCCANCEL) {void ,}

# Is there an auto-completion list visible?
# fun bool AutoCActive(,)
set SCI_AUTOCACTIVE 2102
set prototype(SCI_AUTOCACTIVE) {bool ,}

# Retrieve the position of the caret when the auto-completion list was displayed.
# fun position AutoCPosStart(,)
set SCI_AUTOCPOSSTART 2103
set prototype(SCI_AUTOCPOSSTART) {position ,}

# User has selected an item so remove the list and insert the selection.
# fun void AutoCComplete(,)
set SCI_AUTOCCOMPLETE 2104
set prototype(SCI_AUTOCCOMPLETE) {void ,}

# Define a set of character that when typed cancel the auto-completion list.
# fun void AutoCStops(, string characterSet)
set SCI_AUTOCSTOPS 2105
set prototype(SCI_AUTOCSTOPS) {void {, string characterSet}}

# Change the separator character in the string setting up an auto-completion list.
# Default is space but can be changed if items contain space.
# set void AutoCSetSeparator(int separatorCharacter,)
set SCI_AUTOCSETSEPARATOR 2106
set prototype(SCI_AUTOCSETSEPARATOR) {void {int separatorCharacter,}}

# Retrieve the auto-completion list separator character.
# get int AutoCGetSeparator(,)
set SCI_AUTOCGETSEPARATOR 2107
set prototype(SCI_AUTOCGETSEPARATOR) {int ,}

# Select the item in the auto-completion list that starts with a string.
# fun void AutoCSelect(, string text)
set SCI_AUTOCSELECT 2108
set prototype(SCI_AUTOCSELECT) {void {, string text}}

# Should the auto-completion list be cancelled if the user backspaces to a
# position before where the box was created.
# set void AutoCSetCancelAtStart(bool cancel,)
set SCI_AUTOCSETCANCELATSTART 2110
set prototype(SCI_AUTOCSETCANCELATSTART) {void {bool cancel,}}

# Retrieve whether auto-completion cancelled by backspacing before start.
# get bool AutoCGetCancelAtStart(,)
set SCI_AUTOCGETCANCELATSTART 2111
set prototype(SCI_AUTOCGETCANCELATSTART) {bool ,}

# Define a set of characters that when typed will cause the autocompletion to
# choose the selected item.
# set void AutoCSetFillUps(, string characterSet)
set SCI_AUTOCSETFILLUPS 2112
set prototype(SCI_AUTOCSETFILLUPS) {void {, string characterSet}}

# Should a single item auto-completion list automatically choose the item.
# set void AutoCSetChooseSingle(bool chooseSingle,)
set SCI_AUTOCSETCHOOSESINGLE 2113
set prototype(SCI_AUTOCSETCHOOSESINGLE) {void {bool chooseSingle,}}

# Retrieve whether a single item auto-completion list automatically choose the item.
# get bool AutoCGetChooseSingle(,)
set SCI_AUTOCGETCHOOSESINGLE 2114
set prototype(SCI_AUTOCGETCHOOSESINGLE) {bool ,}

# Set whether case is significant when performing auto-completion searches.
# set void AutoCSetIgnoreCase(bool ignoreCase,)
set SCI_AUTOCSETIGNORECASE 2115
set prototype(SCI_AUTOCSETIGNORECASE) {void {bool ignoreCase,}}

# Retrieve state of ignore case flag.
# get bool AutoCGetIgnoreCase(,)
set SCI_AUTOCGETIGNORECASE 2116
set prototype(SCI_AUTOCGETIGNORECASE) {bool ,}

# Display a list of strings and send notification when user chooses one.
# fun void UserListShow(int listType, string itemList)
set SCI_USERLISTSHOW 2117
set prototype(SCI_USERLISTSHOW) {void {int listType, string itemList}}

# Set whether or not autocompletion is hidden automatically when nothing matches.
# set void AutoCSetAutoHide(bool autoHide,)
set SCI_AUTOCSETAUTOHIDE 2118
set prototype(SCI_AUTOCSETAUTOHIDE) {void {bool autoHide,}}

# Retrieve whether or not autocompletion is hidden automatically when nothing matches.
# get bool AutoCGetAutoHide(,)
set SCI_AUTOCGETAUTOHIDE 2119
set prototype(SCI_AUTOCGETAUTOHIDE) {bool ,}

# Set whether or not autocompletion deletes any word characters
# after the inserted text upon completion.
# set void AutoCSetDropRestOfWord(bool dropRestOfWord,)
set SCI_AUTOCSETDROPRESTOFWORD 2270
set prototype(SCI_AUTOCSETDROPRESTOFWORD) {void {bool dropRestOfWord,}}

# Retrieve whether or not autocompletion deletes any word characters
# after the inserted text upon completion.
# get bool AutoCGetDropRestOfWord(,)
set SCI_AUTOCGETDROPRESTOFWORD 2271
set prototype(SCI_AUTOCGETDROPRESTOFWORD) {bool ,}

# Register an XPM image for use in autocompletion lists.
# fun void RegisterImage(int type, string xpmData)
set SCI_REGISTERIMAGE 2405
set prototype(SCI_REGISTERIMAGE) {void {int type, string xpmData}}

# Clear all the registered XPM images.
# fun void ClearRegisteredImages(,)
set SCI_CLEARREGISTEREDIMAGES 2408
set prototype(SCI_CLEARREGISTEREDIMAGES) {void ,}

# Retrieve the auto-completion list type-separator character.
# get int AutoCGetTypeSeparator(,)
set SCI_AUTOCGETTYPESEPARATOR 2285
set prototype(SCI_AUTOCGETTYPESEPARATOR) {int ,}

# Change the type-separator character in the string setting up an auto-completion list.
# Default is '?' but can be changed if items contain '?'.
# set void AutoCSetTypeSeparator(int separatorCharacter,)
set SCI_AUTOCSETTYPESEPARATOR 2286
set prototype(SCI_AUTOCSETTYPESEPARATOR) {void {int separatorCharacter,}}

# Set the maximum width, in characters, of auto-completion and user lists.
# Set to 0 to autosize to fit longest item, which is the default.
# set void AutoCSetMaxWidth(int characterCount,)
set SCI_AUTOCSETMAXWIDTH 2208
set prototype(SCI_AUTOCSETMAXWIDTH) {void {int characterCount,}}

# Get the maximum width, in characters, of auto-completion and user lists.
# get int AutoCGetMaxWidth(,)
set SCI_AUTOCGETMAXWIDTH 2209
set prototype(SCI_AUTOCGETMAXWIDTH) {int ,}

# Set the maximum height, in rows, of auto-completion and user lists.
# The default is 5 rows.
# set void AutoCSetMaxHeight(int rowCount,)
set SCI_AUTOCSETMAXHEIGHT 2210
set prototype(SCI_AUTOCSETMAXHEIGHT) {void {int rowCount,}}

# Set the maximum height, in rows, of auto-completion and user lists.
# get int AutoCGetMaxHeight(,)
set SCI_AUTOCGETMAXHEIGHT 2211
set prototype(SCI_AUTOCGETMAXHEIGHT) {int ,}

# Set the number of spaces used for one level of indentation.
# set void SetIndent(int indentSize,)
set SCI_SETINDENT 2122
set prototype(SCI_SETINDENT) {void {int indentSize,}}

# Retrieve indentation size.
# get int GetIndent(,)
set SCI_GETINDENT 2123
set prototype(SCI_GETINDENT) {int ,}

# Indentation will only use space characters if useTabs is false, otherwise
# it will use a combination of tabs and spaces.
# set void SetUseTabs(bool useTabs,)
set SCI_SETUSETABS 2124
set prototype(SCI_SETUSETABS) {void {bool useTabs,}}

# Retrieve whether tabs will be used in indentation.
# get bool GetUseTabs(,)
set SCI_GETUSETABS 2125
set prototype(SCI_GETUSETABS) {bool ,}

# Change the indentation of a line to a number of columns.
# set void SetLineIndentation(int line, int indentSize)
set SCI_SETLINEINDENTATION 2126
set prototype(SCI_SETLINEINDENTATION) {void {int line, int indentSize}}

# Retrieve the number of columns that a line is indented.
# get int GetLineIndentation(int line,)
set SCI_GETLINEINDENTATION 2127
set prototype(SCI_GETLINEINDENTATION) {int {int line,}}

# Retrieve the position before the first non indentation character on a line.
# get position GetLineIndentPosition(int line,)
set SCI_GETLINEINDENTPOSITION 2128
set prototype(SCI_GETLINEINDENTPOSITION) {position {int line,}}

# Retrieve the column number of a position, taking tab width into account.
# get int GetColumn(position pos,)
set SCI_GETCOLUMN 2129
set prototype(SCI_GETCOLUMN) {int {position pos,}}

# Count characters between two positions.
# fun int CountCharacters(int startPos, int endPos)
set SCI_COUNTCHARACTERS 2633
set prototype(SCI_COUNTCHARACTERS) {int {int startPos, int endPos}}

# Show or hide the horizontal scroll bar.
# set void SetHScrollBar(bool show,)
set SCI_SETHSCROLLBAR 2130
set prototype(SCI_SETHSCROLLBAR) {void {bool show,}}
# Is the horizontal scroll bar visible?
# get bool GetHScrollBar(,)
set SCI_GETHSCROLLBAR 2131
set prototype(SCI_GETHSCROLLBAR) {bool ,}

lappend enums(IndentView) SC_IV_
set SC_IV_NONE 0
set SC_IV_REAL 1
set SC_IV_LOOKFORWARD 2
set SC_IV_LOOKBOTH 3

# Show or hide indentation guides.
# set void SetIndentationGuides(int indentView,)
set SCI_SETINDENTATIONGUIDES 2132
set prototype(SCI_SETINDENTATIONGUIDES) {void {int indentView,}}

# Are the indentation guides visible?
# get int GetIndentationGuides(,)
set SCI_GETINDENTATIONGUIDES 2133
set prototype(SCI_GETINDENTATIONGUIDES) {int ,}

# Set the highlighted indentation guide column.
# 0 = no highlighted guide.
# set void SetHighlightGuide(int column,)
set SCI_SETHIGHLIGHTGUIDE 2134
set prototype(SCI_SETHIGHLIGHTGUIDE) {void {int column,}}

# Get the highlighted indentation guide column.
# get int GetHighlightGuide(,)
set SCI_GETHIGHLIGHTGUIDE 2135
set prototype(SCI_GETHIGHLIGHTGUIDE) {int ,}

# Get the position after the last visible characters on a line.
# get position GetLineEndPosition(int line,)
set SCI_GETLINEENDPOSITION 2136
set prototype(SCI_GETLINEENDPOSITION) {position {int line,}}

# Get the code page used to interpret the bytes of the document as characters.
# get int GetCodePage(,)
set SCI_GETCODEPAGE 2137
set prototype(SCI_GETCODEPAGE) {int ,}

# Get the foreground colour of the caret.
# get colour GetCaretFore(,)
set SCI_GETCARETFORE 2138
set prototype(SCI_GETCARETFORE) {colour ,}

# In read-only mode?
# get bool GetReadOnly(,)
set SCI_GETREADONLY 2140
set prototype(SCI_GETREADONLY) {bool ,}

# Sets the position of the caret.
# set void SetCurrentPos(position pos,)
set SCI_SETCURRENTPOS 2141
set prototype(SCI_SETCURRENTPOS) {void {position pos,}}

# Sets the position that starts the selection - this becomes the anchor.
# set void SetSelectionStart(position pos,)
set SCI_SETSELECTIONSTART 2142
set prototype(SCI_SETSELECTIONSTART) {void {position pos,}}

# Returns the position at the start of the selection.
# get position GetSelectionStart(,)
set SCI_GETSELECTIONSTART 2143
set prototype(SCI_GETSELECTIONSTART) {position ,}

# Sets the position that ends the selection - this becomes the currentPosition.
# set void SetSelectionEnd(position pos,)
set SCI_SETSELECTIONEND 2144
set prototype(SCI_SETSELECTIONEND) {void {position pos,}}

# Returns the position at the end of the selection.
# get position GetSelectionEnd(,)
set SCI_GETSELECTIONEND 2145
set prototype(SCI_GETSELECTIONEND) {position ,}

# Set caret to a position, while removing any existing selection.
# fun void SetEmptySelection(position pos,)
set SCI_SETEMPTYSELECTION 2556
set prototype(SCI_SETEMPTYSELECTION) {void {position pos,}}

# Sets the print magnification added to the point size of each style for printing.
# set void SetPrintMagnification(int magnification,)
set SCI_SETPRINTMAGNIFICATION 2146
set prototype(SCI_SETPRINTMAGNIFICATION) {void {int magnification,}}

# Returns the print magnification.
# get int GetPrintMagnification(,)
set SCI_GETPRINTMAGNIFICATION 2147
set prototype(SCI_GETPRINTMAGNIFICATION) {int ,}

lappend enums(PrintOption) SC_PRINT_
# PrintColourMode - use same colours as screen.
set SC_PRINT_NORMAL 0
# PrintColourMode - invert the light value of each style for printing.
set SC_PRINT_INVERTLIGHT 1
# PrintColourMode - force black text on white background for printing.
set SC_PRINT_BLACKONWHITE 2
# PrintColourMode - text stays coloured, but all background is forced to be white for printing.
set SC_PRINT_COLOURONWHITE 3
# PrintColourMode - only the default-background is forced to be white for printing.
set SC_PRINT_COLOURONWHITEDEFAULTBG 4

# Modify colours when printing for clearer printed text.
# set void SetPrintColourMode(int mode,)
set SCI_SETPRINTCOLOURMODE 2148
set prototype(SCI_SETPRINTCOLOURMODE) {void {int mode,}}

# Returns the print colour mode.
# get int GetPrintColourMode(,)
set SCI_GETPRINTCOLOURMODE 2149
set prototype(SCI_GETPRINTCOLOURMODE) {int ,}

lappend enums(FindOption) SCFIND_
set SCFIND_WHOLEWORD 0x2
set SCFIND_MATCHCASE 0x4
set SCFIND_WORDSTART 0x00100000
set SCFIND_REGEXP 0x00200000
set SCFIND_POSIX 0x00400000
set SCFIND_CXX11REGEX 0x00800000

# Find some text in the document.
# fun position FindText(int flags, findtext ft)
set SCI_FINDTEXT 2150
set prototype(SCI_FINDTEXT) {position {int flags, findtext ft}}

# On Windows, will draw the document into a display context such as a printer.
# fun position FormatRange(bool draw, formatrange fr)
set SCI_FORMATRANGE 2151
set prototype(SCI_FORMATRANGE) {position {bool draw, formatrange fr}}

# Retrieve the display line at the top of the display.
# get int GetFirstVisibleLine(,)
set SCI_GETFIRSTVISIBLELINE 2152
set prototype(SCI_GETFIRSTVISIBLELINE) {int ,}

# Retrieve the contents of a line.
# Returns the length of the line.
# fun int GetLine(int line, stringresult text)
set SCI_GETLINE 2153
set prototype(SCI_GETLINE) {int {int line, stringresult text}}

# Returns the number of lines in the document. There is always at least one.
# get int GetLineCount(,)
set SCI_GETLINECOUNT 2154
set prototype(SCI_GETLINECOUNT) {int ,}

# Sets the size in pixels of the left margin.
# set void SetMarginLeft(, int pixelWidth)
set SCI_SETMARGINLEFT 2155
set prototype(SCI_SETMARGINLEFT) {void {, int pixelWidth}}

# Returns the size in pixels of the left margin.
# get int GetMarginLeft(,)
set SCI_GETMARGINLEFT 2156
set prototype(SCI_GETMARGINLEFT) {int ,}

# Sets the size in pixels of the right margin.
# set void SetMarginRight(, int pixelWidth)
set SCI_SETMARGINRIGHT 2157
set prototype(SCI_SETMARGINRIGHT) {void {, int pixelWidth}}

# Returns the size in pixels of the right margin.
# get int GetMarginRight(,)
set SCI_GETMARGINRIGHT 2158
set prototype(SCI_GETMARGINRIGHT) {int ,}

# Is the document different from when it was last saved?
# get bool GetModify(,)
set SCI_GETMODIFY 2159
set prototype(SCI_GETMODIFY) {bool ,}

# Select a range of text.
# fun void SetSel(position start, position end)
set SCI_SETSEL 2160
set prototype(SCI_SETSEL) {void {position start, position end}}

# Retrieve the selected text.
# Return the length of the text.
# Result is NUL-terminated.
# fun int GetSelText(, stringresult text)
set SCI_GETSELTEXT 2161
set prototype(SCI_GETSELTEXT) {int {, stringresult text}}

# Retrieve a range of text.
# Return the length of the text.
# fun int GetTextRange(, textrange tr)
set SCI_GETTEXTRANGE 2162
set prototype(SCI_GETTEXTRANGE) {int {, textrange tr}}

# Draw the selection in normal style or with selection highlighted.
# fun void HideSelection(bool normal,)
set SCI_HIDESELECTION 2163
set prototype(SCI_HIDESELECTION) {void {bool normal,}}

# Retrieve the x value of the point in the window where a position is displayed.
# fun int PointXFromPosition(, position pos)
set SCI_POINTXFROMPOSITION 2164
set prototype(SCI_POINTXFROMPOSITION) {int {, position pos}}

# Retrieve the y value of the point in the window where a position is displayed.
# fun int PointYFromPosition(, position pos)
set SCI_POINTYFROMPOSITION 2165
set prototype(SCI_POINTYFROMPOSITION) {int {, position pos}}

# Retrieve the line containing a position.
# fun int LineFromPosition(position pos,)
set SCI_LINEFROMPOSITION 2166
set prototype(SCI_LINEFROMPOSITION) {int {position pos,}}

# Retrieve the position at the start of a line.
# fun position PositionFromLine(int line,)
set SCI_POSITIONFROMLINE 2167
set prototype(SCI_POSITIONFROMLINE) {position {int line,}}

# Scroll horizontally and vertically.
# fun void LineScroll(int columns, int lines)
set SCI_LINESCROLL 2168
set prototype(SCI_LINESCROLL) {void {int columns, int lines}}

# Ensure the caret is visible.
# fun void ScrollCaret(,)
set SCI_SCROLLCARET 2169
set prototype(SCI_SCROLLCARET) {void ,}

# Scroll the argument positions and the range between them into view giving
# priority to the primary position then the secondary position.
# This may be used to make a search match visible.
# fun void ScrollRange(position secondary, position primary)
set SCI_SCROLLRANGE 2569
set prototype(SCI_SCROLLRANGE) {void {position secondary, position primary}}

# Replace the selected text with the argument text.
# fun void ReplaceSel(, string text)
set SCI_REPLACESEL 2170
set prototype(SCI_REPLACESEL) {void {, string text}}

# Set to read only or read write.
# set void SetReadOnly(bool readOnly,)
set SCI_SETREADONLY 2171
set prototype(SCI_SETREADONLY) {void {bool readOnly,}}

# Null operation.
# fun void Null(,)
set SCI_NULL 2172
set prototype(SCI_NULL) {void ,}

# Will a paste succeed?
# fun bool CanPaste(,)
set SCI_CANPASTE 2173
set prototype(SCI_CANPASTE) {bool ,}

# Are there any undoable actions in the undo history?
# fun bool CanUndo(,)
set SCI_CANUNDO 2174
set prototype(SCI_CANUNDO) {bool ,}

# Delete the undo history.
# fun void EmptyUndoBuffer(,)
set SCI_EMPTYUNDOBUFFER 2175
set prototype(SCI_EMPTYUNDOBUFFER) {void ,}

# Undo one action in the undo history.
# fun void Undo(,)
set SCI_UNDO 2176
set prototype(SCI_UNDO) {void ,}

# Cut the selection to the clipboard.
# fun void Cut(,)
set SCI_CUT 2177
set prototype(SCI_CUT) {void ,}

# Copy the selection to the clipboard.
# fun void Copy(,)
set SCI_COPY 2178
set prototype(SCI_COPY) {void ,}

# Paste the contents of the clipboard into the document replacing the selection.
# fun void Paste(,)
set SCI_PASTE 2179
set prototype(SCI_PASTE) {void ,}

# Clear the selection.
# fun void Clear(,)
set SCI_CLEAR 2180
set prototype(SCI_CLEAR) {void ,}

# Replace the contents of the document with the argument text.
# fun void SetText(, string text)
set SCI_SETTEXT 2181
set prototype(SCI_SETTEXT) {void {, string text}}

# Retrieve all the text in the document.
# Returns number of characters retrieved.
# Result is NUL-terminated.
# fun int GetText(int length, stringresult text)
set SCI_GETTEXT 2182
set prototype(SCI_GETTEXT) {int {int length, stringresult text}}

# Retrieve the number of characters in the document.
# get int GetTextLength(,)
set SCI_GETTEXTLENGTH 2183
set prototype(SCI_GETTEXTLENGTH) {int ,}

# Retrieve a pointer to a function that processes messages for this Scintilla.
# get int GetDirectFunction(,)
set SCI_GETDIRECTFUNCTION 2184
set prototype(SCI_GETDIRECTFUNCTION) {int ,}

# Retrieve a pointer value to use as the first argument when calling
# the function returned by GetDirectFunction.
# get int GetDirectPointer(,)
set SCI_GETDIRECTPOINTER 2185
set prototype(SCI_GETDIRECTPOINTER) {int ,}

# Set to overtype (true) or insert mode.
# set void SetOvertype(bool overtype,)
set SCI_SETOVERTYPE 2186
set prototype(SCI_SETOVERTYPE) {void {bool overtype,}}

# Returns true if overtype mode is active otherwise false is returned.
# get bool GetOvertype(,)
set SCI_GETOVERTYPE 2187
set prototype(SCI_GETOVERTYPE) {bool ,}

# Set the width of the insert mode caret.
# set void SetCaretWidth(int pixelWidth,)
set SCI_SETCARETWIDTH 2188
set prototype(SCI_SETCARETWIDTH) {void {int pixelWidth,}}

# Returns the width of the insert mode caret.
# get int GetCaretWidth(,)
set SCI_GETCARETWIDTH 2189
set prototype(SCI_GETCARETWIDTH) {int ,}

# Sets the position that starts the target which is used for updating the
# document without affecting the scroll position.
# set void SetTargetStart(position pos,)
set SCI_SETTARGETSTART 2190
set prototype(SCI_SETTARGETSTART) {void {position pos,}}

# Get the position that starts the target.
# get position GetTargetStart(,)
set SCI_GETTARGETSTART 2191
set prototype(SCI_GETTARGETSTART) {position ,}

# Sets the position that ends the target which is used for updating the
# document without affecting the scroll position.
# set void SetTargetEnd(position pos,)
set SCI_SETTARGETEND 2192
set prototype(SCI_SETTARGETEND) {void {position pos,}}

# Get the position that ends the target.
# get position GetTargetEnd(,)
set SCI_GETTARGETEND 2193
set prototype(SCI_GETTARGETEND) {position ,}

# Sets both the start and end of the target in one call.
# fun void SetTargetRange(position start, position end)
set SCI_SETTARGETRANGE 2686
set prototype(SCI_SETTARGETRANGE) {void {position start, position end}}

# Retrieve the text in the target.
# get int GetTargetText(, stringresult characters)
set SCI_GETTARGETTEXT 2687
set prototype(SCI_GETTARGETTEXT) {int {, stringresult characters}}

# Make the target range start and end be the same as the selection range start and end.
# fun void TargetFromSelection(,)
set SCI_TARGETFROMSELECTION 2287
set prototype(SCI_TARGETFROMSELECTION) {void ,}

# Sets the target to the whole document.
# fun void TargetWholeDocument(,)
set SCI_TARGETWHOLEDOCUMENT 2690
set prototype(SCI_TARGETWHOLEDOCUMENT) {void ,}

# Replace the target text with the argument text.
# Text is counted so it can contain NULs.
# Returns the length of the replacement text.
# fun int ReplaceTarget(int length, string text)
set SCI_REPLACETARGET 2194
set prototype(SCI_REPLACETARGET) {int {int length, string text}}

# Replace the target text with the argument text after \d processing.
# Text is counted so it can contain NULs.
# Looks for \d where d is between 1 and 9 and replaces these with the strings
# matched in the last search operation which were surrounded by \( and \).
# Returns the length of the replacement text including any change
# caused by processing the \d patterns.
# fun int ReplaceTargetRE(int length, string text)
set SCI_REPLACETARGETRE 2195
set prototype(SCI_REPLACETARGETRE) {int {int length, string text}}

# Search for a counted string in the target and set the target to the found
# range. Text is counted so it can contain NULs.
# Returns length of range or -1 for failure in which case target is not moved.
# fun int SearchInTarget(int length, string text)
set SCI_SEARCHINTARGET 2197
set prototype(SCI_SEARCHINTARGET) {int {int length, string text}}

# Set the search flags used by SearchInTarget.
# set void SetSearchFlags(int flags,)
set SCI_SETSEARCHFLAGS 2198
set prototype(SCI_SETSEARCHFLAGS) {void {int flags,}}

# Get the search flags used by SearchInTarget.
# get int GetSearchFlags(,)
set SCI_GETSEARCHFLAGS 2199
set prototype(SCI_GETSEARCHFLAGS) {int ,}

# Show a call tip containing a definition near position pos.
# fun void CallTipShow(position pos, string definition)
set SCI_CALLTIPSHOW 2200
set prototype(SCI_CALLTIPSHOW) {void {position pos, string definition}}

# Remove the call tip from the screen.
# fun void CallTipCancel(,)
set SCI_CALLTIPCANCEL 2201
set prototype(SCI_CALLTIPCANCEL) {void ,}

# Is there an active call tip?
# fun bool CallTipActive(,)
set SCI_CALLTIPACTIVE 2202
set prototype(SCI_CALLTIPACTIVE) {bool ,}

# Retrieve the position where the caret was before displaying the call tip.
# fun position CallTipPosStart(,)
set SCI_CALLTIPPOSSTART 2203
set prototype(SCI_CALLTIPPOSSTART) {position ,}

# Set the start position in order to change when backspacing removes the calltip.
# set void CallTipSetPosStart(int posStart,)
set SCI_CALLTIPSETPOSSTART 2214
set prototype(SCI_CALLTIPSETPOSSTART) {void {int posStart,}}

# Highlight a segment of the definition.
# fun void CallTipSetHlt(int start, int end)
set SCI_CALLTIPSETHLT 2204
set prototype(SCI_CALLTIPSETHLT) {void {int start, int end}}

# Set the background colour for the call tip.
# set void CallTipSetBack(colour back,)
set SCI_CALLTIPSETBACK 2205
set prototype(SCI_CALLTIPSETBACK) {void {colour back,}}

# Set the foreground colour for the call tip.
# set void CallTipSetFore(colour fore,)
set SCI_CALLTIPSETFORE 2206
set prototype(SCI_CALLTIPSETFORE) {void {colour fore,}}

# Set the foreground colour for the highlighted part of the call tip.
# set void CallTipSetForeHlt(colour fore,)
set SCI_CALLTIPSETFOREHLT 2207
set prototype(SCI_CALLTIPSETFOREHLT) {void {colour fore,}}

# Enable use of STYLE_CALLTIP and set call tip tab size in pixels.
# set void CallTipUseStyle(int tabSize,)
set SCI_CALLTIPUSESTYLE 2212
set prototype(SCI_CALLTIPUSESTYLE) {void {int tabSize,}}

# Set position of calltip, above or below text.
# set void CallTipSetPosition(bool above,)
set SCI_CALLTIPSETPOSITION 2213
set prototype(SCI_CALLTIPSETPOSITION) {void {bool above,}}

# Find the display line of a document line taking hidden lines into account.
# fun int VisibleFromDocLine(int line,)
set SCI_VISIBLEFROMDOCLINE 2220
set prototype(SCI_VISIBLEFROMDOCLINE) {int {int line,}}

# Find the document line of a display line taking hidden lines into account.
# fun int DocLineFromVisible(int lineDisplay,)
set SCI_DOCLINEFROMVISIBLE 2221
set prototype(SCI_DOCLINEFROMVISIBLE) {int {int lineDisplay,}}

# The number of display lines needed to wrap a document line
# fun int WrapCount(int line,)
set SCI_WRAPCOUNT 2235
set prototype(SCI_WRAPCOUNT) {int {int line,}}

lappend enums(FoldLevel) SC_FOLDLEVEL
set SC_FOLDLEVELBASE 0x400
set SC_FOLDLEVELWHITEFLAG 0x1000
set SC_FOLDLEVELHEADERFLAG 0x2000
set SC_FOLDLEVELNUMBERMASK 0x0FFF

# Set the fold level of a line.
# This encodes an integer level along with flags indicating whether the
# line is a header and whether it is effectively white space.
# set void SetFoldLevel(int line, int level)
set SCI_SETFOLDLEVEL 2222
set prototype(SCI_SETFOLDLEVEL) {void {int line, int level}}

# Retrieve the fold level of a line.
# get int GetFoldLevel(int line,)
set SCI_GETFOLDLEVEL 2223
set prototype(SCI_GETFOLDLEVEL) {int {int line,}}

# Find the last child line of a header line.
# get int GetLastChild(int line, int level)
set SCI_GETLASTCHILD 2224
set prototype(SCI_GETLASTCHILD) {int {int line, int level}}

# Find the parent line of a child line.
# get int GetFoldParent(int line,)
set SCI_GETFOLDPARENT 2225
set prototype(SCI_GETFOLDPARENT) {int {int line,}}

# Make a range of lines visible.
# fun void ShowLines(int lineStart, int lineEnd)
set SCI_SHOWLINES 2226
set prototype(SCI_SHOWLINES) {void {int lineStart, int lineEnd}}

# Make a range of lines invisible.
# fun void HideLines(int lineStart, int lineEnd)
set SCI_HIDELINES 2227
set prototype(SCI_HIDELINES) {void {int lineStart, int lineEnd}}

# Is a line visible?
# get bool GetLineVisible(int line,)
set SCI_GETLINEVISIBLE 2228
set prototype(SCI_GETLINEVISIBLE) {bool {int line,}}

# Are all lines visible?
# get bool GetAllLinesVisible(,)
set SCI_GETALLLINESVISIBLE 2236
set prototype(SCI_GETALLLINESVISIBLE) {bool ,}

# Show the children of a header line.
# set void SetFoldExpanded(int line, bool expanded)
set SCI_SETFOLDEXPANDED 2229
set prototype(SCI_SETFOLDEXPANDED) {void {int line, bool expanded}}

# Is a header line expanded?
# get bool GetFoldExpanded(int line,)
set SCI_GETFOLDEXPANDED 2230
set prototype(SCI_GETFOLDEXPANDED) {bool {int line,}}

# Switch a header line between expanded and contracted.
# fun void ToggleFold(int line,)
set SCI_TOGGLEFOLD 2231
set prototype(SCI_TOGGLEFOLD) {void {int line,}}

lappend enums(FoldAction) SC_FOLDACTION
set SC_FOLDACTION_CONTRACT 0
set SC_FOLDACTION_EXPAND 1
set SC_FOLDACTION_TOGGLE 2

# Expand or contract a fold header.
# fun void FoldLine(int line, int action)
set SCI_FOLDLINE 2237
set prototype(SCI_FOLDLINE) {void {int line, int action}}

# Expand or contract a fold header and its children.
# fun void FoldChildren(int line, int action)
set SCI_FOLDCHILDREN 2238
set prototype(SCI_FOLDCHILDREN) {void {int line, int action}}

# Expand a fold header and all children. Use the level argument instead of the line's current level.
# fun void ExpandChildren(int line, int level)
set SCI_EXPANDCHILDREN 2239
set prototype(SCI_EXPANDCHILDREN) {void {int line, int level}}

# Expand or contract all fold headers.
# fun void FoldAll(int action,)
set SCI_FOLDALL 2662
set prototype(SCI_FOLDALL) {void {int action,}}

# Ensure a particular line is visible by expanding any header line hiding it.
# fun void EnsureVisible(int line,)
set SCI_ENSUREVISIBLE 2232
set prototype(SCI_ENSUREVISIBLE) {void {int line,}}

lappend enums(AutomaticFold) SC_AUTOMATICFOLD_
set SC_AUTOMATICFOLD_SHOW 0x0001
set SC_AUTOMATICFOLD_CLICK 0x0002
set SC_AUTOMATICFOLD_CHANGE 0x0004

# Set automatic folding behaviours.
# set void SetAutomaticFold(int automaticFold,)
set SCI_SETAUTOMATICFOLD 2663
set prototype(SCI_SETAUTOMATICFOLD) {void {int automaticFold,}}

# Get automatic folding behaviours.
# get int GetAutomaticFold(,)
set SCI_GETAUTOMATICFOLD 2664
set prototype(SCI_GETAUTOMATICFOLD) {int ,}

lappend enums(FoldFlag) SC_FOLDFLAG_
set SC_FOLDFLAG_LINEBEFORE_EXPANDED 0x0002
set SC_FOLDFLAG_LINEBEFORE_CONTRACTED 0x0004
set SC_FOLDFLAG_LINEAFTER_EXPANDED 0x0008
set SC_FOLDFLAG_LINEAFTER_CONTRACTED 0x0010
set SC_FOLDFLAG_LEVELNUMBERS 0x0040
set SC_FOLDFLAG_LINESTATE 0x0080

# Set some style options for folding.
# set void SetFoldFlags(int flags,)
set SCI_SETFOLDFLAGS 2233
set prototype(SCI_SETFOLDFLAGS) {void {int flags,}}

# Ensure a particular line is visible by expanding any header line hiding it.
# Use the currently set visibility policy to determine which range to display.
# fun void EnsureVisibleEnforcePolicy(int line,)
set SCI_ENSUREVISIBLEENFORCEPOLICY 2234
set prototype(SCI_ENSUREVISIBLEENFORCEPOLICY) {void {int line,}}

# Sets whether a tab pressed when caret is within indentation indents.
# set void SetTabIndents(bool tabIndents,)
set SCI_SETTABINDENTS 2260
set prototype(SCI_SETTABINDENTS) {void {bool tabIndents,}}

# Does a tab pressed when caret is within indentation indent?
# get bool GetTabIndents(,)
set SCI_GETTABINDENTS 2261
set prototype(SCI_GETTABINDENTS) {bool ,}

# Sets whether a backspace pressed when caret is within indentation unindents.
# set void SetBackSpaceUnIndents(bool bsUnIndents,)
set SCI_SETBACKSPACEUNINDENTS 2262
set prototype(SCI_SETBACKSPACEUNINDENTS) {void {bool bsUnIndents,}}

# Does a backspace pressed when caret is within indentation unindent?
# get bool GetBackSpaceUnIndents(,)
set SCI_GETBACKSPACEUNINDENTS 2263
set prototype(SCI_GETBACKSPACEUNINDENTS) {bool ,}

set SC_TIME_FOREVER 10000000

# Sets the time the mouse must sit still to generate a mouse dwell event.
# set void SetMouseDwellTime(int periodMilliseconds,)
set SCI_SETMOUSEDWELLTIME 2264
set prototype(SCI_SETMOUSEDWELLTIME) {void {int periodMilliseconds,}}

# Retrieve the time the mouse must sit still to generate a mouse dwell event.
# get int GetMouseDwellTime(,)
set SCI_GETMOUSEDWELLTIME 2265
set prototype(SCI_GETMOUSEDWELLTIME) {int ,}

# Get position of start of word.
# fun int WordStartPosition(position pos, bool onlyWordCharacters)
set SCI_WORDSTARTPOSITION 2266
set prototype(SCI_WORDSTARTPOSITION) {int {position pos, bool onlyWordCharacters}}

# Get position of end of word.
# fun int WordEndPosition(position pos, bool onlyWordCharacters)
set SCI_WORDENDPOSITION 2267
set prototype(SCI_WORDENDPOSITION) {int {position pos, bool onlyWordCharacters}}

# Is the range start..end considered a word?
# fun bool IsRangeWord(position start, position end)
set SCI_ISRANGEWORD 2691
set prototype(SCI_ISRANGEWORD) {bool {position start, position end}}

lappend enums(IdleStyling) SC_IDLESTYLING_
set SC_IDLESTYLING_NONE 0
set SC_IDLESTYLING_TOVISIBLE 1
set SC_IDLESTYLING_AFTERVISIBLE 2
set SC_IDLESTYLING_ALL 3

# Sets limits to idle styling.
# set void SetIdleStyling(int idleStyling,)
set SCI_SETIDLESTYLING 2692
set prototype(SCI_SETIDLESTYLING) {void {int idleStyling,}}

# Retrieve the limits to idle styling.
# get int GetIdleStyling(,)
set SCI_GETIDLESTYLING 2693
set prototype(SCI_GETIDLESTYLING) {int ,}

lappend enums(Wrap) SC_WRAP_
set SC_WRAP_NONE 0
set SC_WRAP_WORD 1
set SC_WRAP_CHAR 2
set SC_WRAP_WHITESPACE 3

# Sets whether text is word wrapped.
# set void SetWrapMode(int mode,)
set SCI_SETWRAPMODE 2268
set prototype(SCI_SETWRAPMODE) {void {int mode,}}

# Retrieve whether text is word wrapped.
# get int GetWrapMode(,)
set SCI_GETWRAPMODE 2269
set prototype(SCI_GETWRAPMODE) {int ,}

lappend enums(WrapVisualFlag) SC_WRAPVISUALFLAG_
set SC_WRAPVISUALFLAG_NONE 0x0000
set SC_WRAPVISUALFLAG_END 0x0001
set SC_WRAPVISUALFLAG_START 0x0002
set SC_WRAPVISUALFLAG_MARGIN 0x0004

# Set the display mode of visual flags for wrapped lines.
# set void SetWrapVisualFlags(int wrapVisualFlags,)
set SCI_SETWRAPVISUALFLAGS 2460
set prototype(SCI_SETWRAPVISUALFLAGS) {void {int wrapVisualFlags,}}

# Retrive the display mode of visual flags for wrapped lines.
# get int GetWrapVisualFlags(,)
set SCI_GETWRAPVISUALFLAGS 2461
set prototype(SCI_GETWRAPVISUALFLAGS) {int ,}

lappend enums(WrapVisualLocation) SC_WRAPVISUALFLAGLOC_
set SC_WRAPVISUALFLAGLOC_DEFAULT 0x0000
set SC_WRAPVISUALFLAGLOC_END_BY_TEXT 0x0001
set SC_WRAPVISUALFLAGLOC_START_BY_TEXT 0x0002

# Set the location of visual flags for wrapped lines.
# set void SetWrapVisualFlagsLocation(int wrapVisualFlagsLocation,)
set SCI_SETWRAPVISUALFLAGSLOCATION 2462
set prototype(SCI_SETWRAPVISUALFLAGSLOCATION) {void {int wrapVisualFlagsLocation,}}

# Retrive the location of visual flags for wrapped lines.
# get int GetWrapVisualFlagsLocation(,)
set SCI_GETWRAPVISUALFLAGSLOCATION 2463
set prototype(SCI_GETWRAPVISUALFLAGSLOCATION) {int ,}

# Set the start indent for wrapped lines.
# set void SetWrapStartIndent(int indent,)
set SCI_SETWRAPSTARTINDENT 2464
set prototype(SCI_SETWRAPSTARTINDENT) {void {int indent,}}

# Retrive the start indent for wrapped lines.
# get int GetWrapStartIndent(,)
set SCI_GETWRAPSTARTINDENT 2465
set prototype(SCI_GETWRAPSTARTINDENT) {int ,}

lappend enums(WrapIndentMode) SC_WRAPINDENT_
set SC_WRAPINDENT_FIXED 0
set SC_WRAPINDENT_SAME 1
set SC_WRAPINDENT_INDENT 2

# Sets how wrapped sublines are placed. Default is fixed.
# set void SetWrapIndentMode(int mode,)
set SCI_SETWRAPINDENTMODE 2472
set prototype(SCI_SETWRAPINDENTMODE) {void {int mode,}}

# Retrieve how wrapped sublines are placed. Default is fixed.
# get int GetWrapIndentMode(,)
set SCI_GETWRAPINDENTMODE 2473
set prototype(SCI_GETWRAPINDENTMODE) {int ,}

lappend enums(LineCache) SC_CACHE_
set SC_CACHE_NONE 0
set SC_CACHE_CARET 1
set SC_CACHE_PAGE 2
set SC_CACHE_DOCUMENT 3

# Sets the degree of caching of layout information.
# set void SetLayoutCache(int mode,)
set SCI_SETLAYOUTCACHE 2272
set prototype(SCI_SETLAYOUTCACHE) {void {int mode,}}

# Retrieve the degree of caching of layout information.
# get int GetLayoutCache(,)
set SCI_GETLAYOUTCACHE 2273
set prototype(SCI_GETLAYOUTCACHE) {int ,}

# Sets the document width assumed for scrolling.
# set void SetScrollWidth(int pixelWidth,)
set SCI_SETSCROLLWIDTH 2274
set prototype(SCI_SETSCROLLWIDTH) {void {int pixelWidth,}}

# Retrieve the document width assumed for scrolling.
# get int GetScrollWidth(,)
set SCI_GETSCROLLWIDTH 2275
set prototype(SCI_GETSCROLLWIDTH) {int ,}

# Sets whether the maximum width line displayed is used to set scroll width.
# set void SetScrollWidthTracking(bool tracking,)
set SCI_SETSCROLLWIDTHTRACKING 2516
set prototype(SCI_SETSCROLLWIDTHTRACKING) {void {bool tracking,}}

# Retrieve whether the scroll width tracks wide lines.
# get bool GetScrollWidthTracking(,)
set SCI_GETSCROLLWIDTHTRACKING 2517
set prototype(SCI_GETSCROLLWIDTHTRACKING) {bool ,}

# Measure the pixel width of some text in a particular style.
# NUL terminated text argument.
# Does not handle tab or control characters.
# fun int TextWidth(int style, string text)
set SCI_TEXTWIDTH 2276
set prototype(SCI_TEXTWIDTH) {int {int style, string text}}

# Sets the scroll range so that maximum scroll position has
# the last line at the bottom of the view (default).
# Setting this to false allows scrolling one page below the last line.
# set void SetEndAtLastLine(bool endAtLastLine,)
set SCI_SETENDATLASTLINE 2277
set prototype(SCI_SETENDATLASTLINE) {void {bool endAtLastLine,}}

# Retrieve whether the maximum scroll position has the last
# line at the bottom of the view.
# get bool GetEndAtLastLine(,)
set SCI_GETENDATLASTLINE 2278
set prototype(SCI_GETENDATLASTLINE) {bool ,}

# Retrieve the height of a particular line of text in pixels.
# fun int TextHeight(int line,)
set SCI_TEXTHEIGHT 2279
set prototype(SCI_TEXTHEIGHT) {int {int line,}}

# Show or hide the vertical scroll bar.
# set void SetVScrollBar(bool show,)
set SCI_SETVSCROLLBAR 2280
set prototype(SCI_SETVSCROLLBAR) {void {bool show,}}

# Is the vertical scroll bar visible?
# get bool GetVScrollBar(,)
set SCI_GETVSCROLLBAR 2281
set prototype(SCI_GETVSCROLLBAR) {bool ,}

# Append a string to the end of the document without changing the selection.
# fun void AppendText(int length, string text)
set SCI_APPENDTEXT 2282
set prototype(SCI_APPENDTEXT) {void {int length, string text}}

# Is drawing done in two phases with backgrounds drawn before foregrounds?
# get bool GetTwoPhaseDraw(,)
set SCI_GETTWOPHASEDRAW 2283
set prototype(SCI_GETTWOPHASEDRAW) {bool ,}

# In twoPhaseDraw mode, drawing is performed in two phases, first the background
# and then the foreground. This avoids chopping off characters that overlap the next run.
# set void SetTwoPhaseDraw(bool twoPhase,)
set SCI_SETTWOPHASEDRAW 2284
set prototype(SCI_SETTWOPHASEDRAW) {void {bool twoPhase,}}

lappend enums(FontQuality) SC_PHASES_
set SC_PHASES_ONE 0
set SC_PHASES_TWO 1
set SC_PHASES_MULTIPLE 2

# How many phases is drawing done in?
# get int GetPhasesDraw(,)
set SCI_GETPHASESDRAW 2673
set prototype(SCI_GETPHASESDRAW) {int ,}

# In one phase draw, text is drawn in a series of rectangular blocks with no overlap.
# In two phase draw, text is drawn in a series of lines allowing runs to overlap horizontally.
# In multiple phase draw, each element is drawn over the whole drawing area, allowing text
# to overlap from one line to the next.
# set void SetPhasesDraw(int phases,)
set SCI_SETPHASESDRAW 2674
set prototype(SCI_SETPHASESDRAW) {void {int phases,}}

# Control font anti-aliasing.

lappend enums(FontQuality) SC_EFF_
set SC_EFF_QUALITY_MASK 0xF
set SC_EFF_QUALITY_DEFAULT 0
set SC_EFF_QUALITY_NON_ANTIALIASED 1
set SC_EFF_QUALITY_ANTIALIASED 2
set SC_EFF_QUALITY_LCD_OPTIMIZED 3

# Choose the quality level for text from the FontQuality enumeration.
# set void SetFontQuality(int fontQuality,)
set SCI_SETFONTQUALITY 2611
set prototype(SCI_SETFONTQUALITY) {void {int fontQuality,}}

# Retrieve the quality level for text.
# get int GetFontQuality(,)
set SCI_GETFONTQUALITY 2612
set prototype(SCI_GETFONTQUALITY) {int ,}

# Scroll so that a display line is at the top of the display.
# set void SetFirstVisibleLine(int lineDisplay,)
set SCI_SETFIRSTVISIBLELINE 2613
set prototype(SCI_SETFIRSTVISIBLELINE) {void {int lineDisplay,}}

lappend enums(MultiPaste) SC_MULTIPASTE_
set SC_MULTIPASTE_ONCE 0
set SC_MULTIPASTE_EACH 1

# Change the effect of pasting when there are multiple selections.
# set void SetMultiPaste(int multiPaste,)
set SCI_SETMULTIPASTE 2614
set prototype(SCI_SETMULTIPASTE) {void {int multiPaste,}}

# Retrieve the effect of pasting when there are multiple selections.
# get int GetMultiPaste(,)
set SCI_GETMULTIPASTE 2615
set prototype(SCI_GETMULTIPASTE) {int ,}

# Retrieve the value of a tag from a regular expression search.
# Result is NUL-terminated.
# get int GetTag(int tagNumber, stringresult tagValue)
set SCI_GETTAG 2616
set prototype(SCI_GETTAG) {int {int tagNumber, stringresult tagValue}}

# Join the lines in the target.
# fun void LinesJoin(,)
set SCI_LINESJOIN 2288
set prototype(SCI_LINESJOIN) {void ,}

# Split the lines in the target into lines that are less wide than pixelWidth
# where possible.
# fun void LinesSplit(int pixelWidth,)
set SCI_LINESSPLIT 2289
set prototype(SCI_LINESSPLIT) {void {int pixelWidth,}}

# Set the colours used as a chequerboard pattern in the fold margin
# fun void SetFoldMarginColour(bool useSetting, colour back)
set SCI_SETFOLDMARGINCOLOUR 2290
set prototype(SCI_SETFOLDMARGINCOLOUR) {void {bool useSetting, colour back}}
# fun void SetFoldMarginHiColour(bool useSetting, colour fore)
set SCI_SETFOLDMARGINHICOLOUR 2291
set prototype(SCI_SETFOLDMARGINHICOLOUR) {void {bool useSetting, colour fore}}

# Move caret down one line.
# fun void LineDown(,)
set SCI_LINEDOWN 2300
set prototype(SCI_LINEDOWN) {void ,}

# Move caret down one line extending selection to new caret position.
# fun void LineDownExtend(,)
set SCI_LINEDOWNEXTEND 2301
set prototype(SCI_LINEDOWNEXTEND) {void ,}

# Move caret up one line.
# fun void LineUp(,)
set SCI_LINEUP 2302
set prototype(SCI_LINEUP) {void ,}

# Move caret up one line extending selection to new caret position.
# fun void LineUpExtend(,)
set SCI_LINEUPEXTEND 2303
set prototype(SCI_LINEUPEXTEND) {void ,}

# Move caret left one character.
# fun void CharLeft(,)
set SCI_CHARLEFT 2304
set prototype(SCI_CHARLEFT) {void ,}

# Move caret left one character extending selection to new caret position.
# fun void CharLeftExtend(,)
set SCI_CHARLEFTEXTEND 2305
set prototype(SCI_CHARLEFTEXTEND) {void ,}

# Move caret right one character.
# fun void CharRight(,)
set SCI_CHARRIGHT 2306
set prototype(SCI_CHARRIGHT) {void ,}

# Move caret right one character extending selection to new caret position.
# fun void CharRightExtend(,)
set SCI_CHARRIGHTEXTEND 2307
set prototype(SCI_CHARRIGHTEXTEND) {void ,}

# Move caret left one word.
# fun void WordLeft(,)
set SCI_WORDLEFT 2308
set prototype(SCI_WORDLEFT) {void ,}

# Move caret left one word extending selection to new caret position.
# fun void WordLeftExtend(,)
set SCI_WORDLEFTEXTEND 2309
set prototype(SCI_WORDLEFTEXTEND) {void ,}

# Move caret right one word.
# fun void WordRight(,)
set SCI_WORDRIGHT 2310
set prototype(SCI_WORDRIGHT) {void ,}

# Move caret right one word extending selection to new caret position.
# fun void WordRightExtend(,)
set SCI_WORDRIGHTEXTEND 2311
set prototype(SCI_WORDRIGHTEXTEND) {void ,}

# Move caret to first position on line.
# fun void Home(,)
set SCI_HOME 2312
set prototype(SCI_HOME) {void ,}

# Move caret to first position on line extending selection to new caret position.
# fun void HomeExtend(,)
set SCI_HOMEEXTEND 2313
set prototype(SCI_HOMEEXTEND) {void ,}

# Move caret to last position on line.
# fun void LineEnd(,)
set SCI_LINEEND 2314
set prototype(SCI_LINEEND) {void ,}

# Move caret to last position on line extending selection to new caret position.
# fun void LineEndExtend(,)
set SCI_LINEENDEXTEND 2315
set prototype(SCI_LINEENDEXTEND) {void ,}

# Move caret to first position in document.
# fun void DocumentStart(,)
set SCI_DOCUMENTSTART 2316
set prototype(SCI_DOCUMENTSTART) {void ,}

# Move caret to first position in document extending selection to new caret position.
# fun void DocumentStartExtend(,)
set SCI_DOCUMENTSTARTEXTEND 2317
set prototype(SCI_DOCUMENTSTARTEXTEND) {void ,}

# Move caret to last position in document.
# fun void DocumentEnd(,)
set SCI_DOCUMENTEND 2318
set prototype(SCI_DOCUMENTEND) {void ,}

# Move caret to last position in document extending selection to new caret position.
# fun void DocumentEndExtend(,)
set SCI_DOCUMENTENDEXTEND 2319
set prototype(SCI_DOCUMENTENDEXTEND) {void ,}

# Move caret one page up.
# fun void PageUp(,)
set SCI_PAGEUP 2320
set prototype(SCI_PAGEUP) {void ,}

# Move caret one page up extending selection to new caret position.
# fun void PageUpExtend(,)
set SCI_PAGEUPEXTEND 2321
set prototype(SCI_PAGEUPEXTEND) {void ,}

# Move caret one page down.
# fun void PageDown(,)
set SCI_PAGEDOWN 2322
set prototype(SCI_PAGEDOWN) {void ,}

# Move caret one page down extending selection to new caret position.
# fun void PageDownExtend(,)
set SCI_PAGEDOWNEXTEND 2323
set prototype(SCI_PAGEDOWNEXTEND) {void ,}

# Switch from insert to overtype mode or the reverse.
# fun void EditToggleOvertype(,)
set SCI_EDITTOGGLEOVERTYPE 2324
set prototype(SCI_EDITTOGGLEOVERTYPE) {void ,}

# Cancel any modes such as call tip or auto-completion list display.
# fun void Cancel(,)
set SCI_CANCEL 2325
set prototype(SCI_CANCEL) {void ,}

# Delete the selection or if no selection, the character before the caret.
# fun void DeleteBack(,)
set SCI_DELETEBACK 2326
set prototype(SCI_DELETEBACK) {void ,}

# If selection is empty or all on one line replace the selection with a tab character.
# If more than one line selected, indent the lines.
# fun void Tab(,)
set SCI_TAB 2327
set prototype(SCI_TAB) {void ,}

# Dedent the selected lines.
# fun void BackTab(,)
set SCI_BACKTAB 2328
set prototype(SCI_BACKTAB) {void ,}

# Insert a new line, may use a CRLF, CR or LF depending on EOL mode.
# fun void NewLine(,)
set SCI_NEWLINE 2329
set prototype(SCI_NEWLINE) {void ,}

# Insert a Form Feed character.
# fun void FormFeed(,)
set SCI_FORMFEED 2330
set prototype(SCI_FORMFEED) {void ,}

# Move caret to before first visible character on line.
# If already there move to first character on line.
# fun void VCHome(,)
set SCI_VCHOME 2331
set prototype(SCI_VCHOME) {void ,}

# Like VCHome but extending selection to new caret position.
# fun void VCHomeExtend(,)
set SCI_VCHOMEEXTEND 2332
set prototype(SCI_VCHOMEEXTEND) {void ,}

# Magnify the displayed text by increasing the sizes by 1 point.
# fun void ZoomIn(,)
set SCI_ZOOMIN 2333
set prototype(SCI_ZOOMIN) {void ,}

# Make the displayed text smaller by decreasing the sizes by 1 point.
# fun void ZoomOut(,)
set SCI_ZOOMOUT 2334
set prototype(SCI_ZOOMOUT) {void ,}

# Delete the word to the left of the caret.
# fun void DelWordLeft(,)
set SCI_DELWORDLEFT 2335
set prototype(SCI_DELWORDLEFT) {void ,}

# Delete the word to the right of the caret.
# fun void DelWordRight(,)
set SCI_DELWORDRIGHT 2336
set prototype(SCI_DELWORDRIGHT) {void ,}

# Delete the word to the right of the caret, but not the trailing non-word characters.
# fun void DelWordRightEnd(,)
set SCI_DELWORDRIGHTEND 2518
set prototype(SCI_DELWORDRIGHTEND) {void ,}

# Cut the line containing the caret.
# fun void LineCut(,)
set SCI_LINECUT 2337
set prototype(SCI_LINECUT) {void ,}

# Delete the line containing the caret.
# fun void LineDelete(,)
set SCI_LINEDELETE 2338
set prototype(SCI_LINEDELETE) {void ,}

# Switch the current line with the previous.
# fun void LineTranspose(,)
set SCI_LINETRANSPOSE 2339
set prototype(SCI_LINETRANSPOSE) {void ,}

# Duplicate the current line.
# fun void LineDuplicate(,)
set SCI_LINEDUPLICATE 2404
set prototype(SCI_LINEDUPLICATE) {void ,}

# Transform the selection to lower case.
# fun void LowerCase(,)
set SCI_LOWERCASE 2340
set prototype(SCI_LOWERCASE) {void ,}

# Transform the selection to upper case.
# fun void UpperCase(,)
set SCI_UPPERCASE 2341
set prototype(SCI_UPPERCASE) {void ,}

# Scroll the document down, keeping the caret visible.
# fun void LineScrollDown(,)
set SCI_LINESCROLLDOWN 2342
set prototype(SCI_LINESCROLLDOWN) {void ,}

# Scroll the document up, keeping the caret visible.
# fun void LineScrollUp(,)
set SCI_LINESCROLLUP 2343
set prototype(SCI_LINESCROLLUP) {void ,}

# Delete the selection or if no selection, the character before the caret.
# Will not delete the character before at the start of a line.
# fun void DeleteBackNotLine(,)
set SCI_DELETEBACKNOTLINE 2344
set prototype(SCI_DELETEBACKNOTLINE) {void ,}

# Move caret to first position on display line.
# fun void HomeDisplay(,)
set SCI_HOMEDISPLAY 2345
set prototype(SCI_HOMEDISPLAY) {void ,}

# Move caret to first position on display line extending selection to
# new caret position.
# fun void HomeDisplayExtend(,)
set SCI_HOMEDISPLAYEXTEND 2346
set prototype(SCI_HOMEDISPLAYEXTEND) {void ,}

# Move caret to last position on display line.
# fun void LineEndDisplay(,)
set SCI_LINEENDDISPLAY 2347
set prototype(SCI_LINEENDDISPLAY) {void ,}

# Move caret to last position on display line extending selection to new
# caret position.
# fun void LineEndDisplayExtend(,)
set SCI_LINEENDDISPLAYEXTEND 2348
set prototype(SCI_LINEENDDISPLAYEXTEND) {void ,}

# These are like their namesakes Home(Extend)?, LineEnd(Extend)?, VCHome(Extend)?
# except they behave differently when word-wrap is enabled:
# They go first to the start / end of the display line, like (Home|LineEnd)Display
# The difference is that, the cursor is already at the point, it goes on to the start
# or end of the document line, as appropriate for (Home|LineEnd|VCHome)(Extend)?.

# fun void HomeWrap(,)
set SCI_HOMEWRAP 2349
set prototype(SCI_HOMEWRAP) {void ,}
# fun void HomeWrapExtend(,)
set SCI_HOMEWRAPEXTEND 2450
set prototype(SCI_HOMEWRAPEXTEND) {void ,}
# fun void LineEndWrap(,)
set SCI_LINEENDWRAP 2451
set prototype(SCI_LINEENDWRAP) {void ,}
# fun void LineEndWrapExtend(,)
set SCI_LINEENDWRAPEXTEND 2452
set prototype(SCI_LINEENDWRAPEXTEND) {void ,}
# fun void VCHomeWrap(,)
set SCI_VCHOMEWRAP 2453
set prototype(SCI_VCHOMEWRAP) {void ,}
# fun void VCHomeWrapExtend(,)
set SCI_VCHOMEWRAPEXTEND 2454
set prototype(SCI_VCHOMEWRAPEXTEND) {void ,}

# Copy the line containing the caret.
# fun void LineCopy(,)
set SCI_LINECOPY 2455
set prototype(SCI_LINECOPY) {void ,}

# Move the caret inside current view if it's not there already.
# fun void MoveCaretInsideView(,)
set SCI_MOVECARETINSIDEVIEW 2401
set prototype(SCI_MOVECARETINSIDEVIEW) {void ,}

# How many characters are on a line, including end of line characters?
# fun int LineLength(int line,)
set SCI_LINELENGTH 2350
set prototype(SCI_LINELENGTH) {int {int line,}}

# Highlight the characters at two positions.
# fun void BraceHighlight(position pos1, position pos2)
set SCI_BRACEHIGHLIGHT 2351
set prototype(SCI_BRACEHIGHLIGHT) {void {position pos1, position pos2}}

# Use specified indicator to highlight matching braces instead of changing their style.
# fun void BraceHighlightIndicator(bool useBraceHighlightIndicator, int indicator)
set SCI_BRACEHIGHLIGHTINDICATOR 2498
set prototype(SCI_BRACEHIGHLIGHTINDICATOR) {void {bool useBraceHighlightIndicator, int indicator}}

# Highlight the character at a position indicating there is no matching brace.
# fun void BraceBadLight(position pos,)
set SCI_BRACEBADLIGHT 2352
set prototype(SCI_BRACEBADLIGHT) {void {position pos,}}

# Use specified indicator to highlight non matching brace instead of changing its style.
# fun void BraceBadLightIndicator(bool useBraceBadLightIndicator, int indicator)
set SCI_BRACEBADLIGHTINDICATOR 2499
set prototype(SCI_BRACEBADLIGHTINDICATOR) {void {bool useBraceBadLightIndicator, int indicator}}

# Find the position of a matching brace or INVALID_POSITION if no match.
# fun position BraceMatch(position pos,)
set SCI_BRACEMATCH 2353
set prototype(SCI_BRACEMATCH) {position {position pos,}}

# Are the end of line characters visible?
# get bool GetViewEOL(,)
set SCI_GETVIEWEOL 2355
set prototype(SCI_GETVIEWEOL) {bool ,}

# Make the end of line characters visible or invisible.
# set void SetViewEOL(bool visible,)
set SCI_SETVIEWEOL 2356
set prototype(SCI_SETVIEWEOL) {void {bool visible,}}

# Retrieve a pointer to the document object.
# get int GetDocPointer(,)
set SCI_GETDOCPOINTER 2357
set prototype(SCI_GETDOCPOINTER) {int ,}

# Change the document object used.
# set void SetDocPointer(, int pointer)
set SCI_SETDOCPOINTER 2358
set prototype(SCI_SETDOCPOINTER) {void {, int pointer}}

# Set which document modification events are sent to the container.
# set void SetModEventMask(int mask,)
set SCI_SETMODEVENTMASK 2359
set prototype(SCI_SETMODEVENTMASK) {void {int mask,}}

lappend enums(EdgeVisualStyle) EDGE_
set EDGE_NONE 0
set EDGE_LINE 1
set EDGE_BACKGROUND 2

# Retrieve the column number which text should be kept within.
# get int GetEdgeColumn(,)
set SCI_GETEDGECOLUMN 2360
set prototype(SCI_GETEDGECOLUMN) {int ,}

# Set the column number of the edge.
# If text goes past the edge then it is highlighted.
# set void SetEdgeColumn(int column,)
set SCI_SETEDGECOLUMN 2361
set prototype(SCI_SETEDGECOLUMN) {void {int column,}}

# Retrieve the edge highlight mode.
# get int GetEdgeMode(,)
set SCI_GETEDGEMODE 2362
set prototype(SCI_GETEDGEMODE) {int ,}

# The edge may be displayed by a line (EDGE_LINE) or by highlighting text that
# goes beyond it (EDGE_BACKGROUND) or not displayed at all (EDGE_NONE).
# set void SetEdgeMode(int mode,)
set SCI_SETEDGEMODE 2363
set prototype(SCI_SETEDGEMODE) {void {int mode,}}

# Retrieve the colour used in edge indication.
# get colour GetEdgeColour(,)
set SCI_GETEDGECOLOUR 2364
set prototype(SCI_GETEDGECOLOUR) {colour ,}

# Change the colour used in edge indication.
# set void SetEdgeColour(colour edgeColour,)
set SCI_SETEDGECOLOUR 2365
set prototype(SCI_SETEDGECOLOUR) {void {colour edgeColour,}}

# Sets the current caret position to be the search anchor.
# fun void SearchAnchor(,)
set SCI_SEARCHANCHOR 2366
set prototype(SCI_SEARCHANCHOR) {void ,}

# Find some text starting at the search anchor.
# Does not ensure the selection is visible.
# fun int SearchNext(int flags, string text)
set SCI_SEARCHNEXT 2367
set prototype(SCI_SEARCHNEXT) {int {int flags, string text}}

# Find some text starting at the search anchor and moving backwards.
# Does not ensure the selection is visible.
# fun int SearchPrev(int flags, string text)
set SCI_SEARCHPREV 2368
set prototype(SCI_SEARCHPREV) {int {int flags, string text}}

# Retrieves the number of lines completely visible.
# get int LinesOnScreen(,)
set SCI_LINESONSCREEN 2370
set prototype(SCI_LINESONSCREEN) {int ,}

# Set whether a pop up menu is displayed automatically when the user presses
# the wrong mouse button.
# fun void UsePopUp(bool allowPopUp,)
set SCI_USEPOPUP 2371
set prototype(SCI_USEPOPUP) {void {bool allowPopUp,}}

# Is the selection rectangular? The alternative is the more common stream selection.
# get bool SelectionIsRectangle(,)
set SCI_SELECTIONISRECTANGLE 2372
set prototype(SCI_SELECTIONISRECTANGLE) {bool ,}

# Set the zoom level. This number of points is added to the size of all fonts.
# It may be positive to magnify or negative to reduce.
# set void SetZoom(int zoom,)
set SCI_SETZOOM 2373
set prototype(SCI_SETZOOM) {void {int zoom,}}
# Retrieve the zoom level.
# get int GetZoom(,)
set SCI_GETZOOM 2374
set prototype(SCI_GETZOOM) {int ,}

# Create a new document object.
# Starts with reference count of 1 and not selected into editor.
# fun int CreateDocument(,)
set SCI_CREATEDOCUMENT 2375
set prototype(SCI_CREATEDOCUMENT) {int ,}
# Extend life of document.
# fun void AddRefDocument(, int doc)
set SCI_ADDREFDOCUMENT 2376
set prototype(SCI_ADDREFDOCUMENT) {void {, int doc}}
# Release a reference to the document, deleting document if it fades to black.
# fun void ReleaseDocument(, int doc)
set SCI_RELEASEDOCUMENT 2377
set prototype(SCI_RELEASEDOCUMENT) {void {, int doc}}

# Get which document modification events are sent to the container.
# get int GetModEventMask(,)
set SCI_GETMODEVENTMASK 2378
set prototype(SCI_GETMODEVENTMASK) {int ,}

# Change internal focus flag.
# set void SetFocus(bool focus,)
set SCI_SETFOCUS 2380
set prototype(SCI_SETFOCUS) {void {bool focus,}}
# Get internal focus flag.
# get bool GetFocus(,)
set SCI_GETFOCUS 2381
set prototype(SCI_GETFOCUS) {bool ,}

lappend enums(Status) SC_STATUS_
set SC_STATUS_OK 0
set SC_STATUS_FAILURE 1
set SC_STATUS_BADALLOC 2
set SC_STATUS_WARN_START 1000
set SC_STATUS_WARN_REGEX 1001

# Change error status - 0 = OK.
# set void SetStatus(int statusCode,)
set SCI_SETSTATUS 2382
set prototype(SCI_SETSTATUS) {void {int statusCode,}}
# Get error status.
# get int GetStatus(,)
set SCI_GETSTATUS 2383
set prototype(SCI_GETSTATUS) {int ,}

# Set whether the mouse is captured when its button is pressed.
# set void SetMouseDownCaptures(bool captures,)
set SCI_SETMOUSEDOWNCAPTURES 2384
set prototype(SCI_SETMOUSEDOWNCAPTURES) {void {bool captures,}}
# Get whether mouse gets captured.
# get bool GetMouseDownCaptures(,)
set SCI_GETMOUSEDOWNCAPTURES 2385
set prototype(SCI_GETMOUSEDOWNCAPTURES) {bool ,}

lappend enums(CursorShape) SC_CURSOR
set SC_CURSORARROW 2
set SC_CURSORWAIT 4
set SC_CURSORREVERSEARROW 7
# Sets the cursor to one of the SC_CURSOR* values.
# set void SetCursor(int cursorType,)
set SCI_SETCURSOR 2386
set prototype(SCI_SETCURSOR) {void {int cursorType,}}
# Get cursor type.
# get int GetCursor(,)
set SCI_GETCURSOR 2387
set prototype(SCI_GETCURSOR) {int ,}

# Change the way control characters are displayed:
# If symbol is < 32, keep the drawn way, else, use the given character.
# set void SetControlCharSymbol(int symbol,)
set SCI_SETCONTROLCHARSYMBOL 2388
set prototype(SCI_SETCONTROLCHARSYMBOL) {void {int symbol,}}
# Get the way control characters are displayed.
# get int GetControlCharSymbol(,)
set SCI_GETCONTROLCHARSYMBOL 2389
set prototype(SCI_GETCONTROLCHARSYMBOL) {int ,}

# Move to the previous change in capitalisation.
# fun void WordPartLeft(,)
set SCI_WORDPARTLEFT 2390
set prototype(SCI_WORDPARTLEFT) {void ,}
# Move to the previous change in capitalisation extending selection
# to new caret position.
# fun void WordPartLeftExtend(,)
set SCI_WORDPARTLEFTEXTEND 2391
set prototype(SCI_WORDPARTLEFTEXTEND) {void ,}
# Move to the change next in capitalisation.
# fun void WordPartRight(,)
set SCI_WORDPARTRIGHT 2392
set prototype(SCI_WORDPARTRIGHT) {void ,}
# Move to the next change in capitalisation extending selection
# to new caret position.
# fun void WordPartRightExtend(,)
set SCI_WORDPARTRIGHTEXTEND 2393
set prototype(SCI_WORDPARTRIGHTEXTEND) {void ,}

# Constants for use with SetVisiblePolicy, similar to SetCaretPolicy.
set VISIBLE_SLOP 0x01
set VISIBLE_STRICT 0x04
# Set the way the display area is determined when a particular line
# is to be moved to by Find, FindNext, GotoLine, etc.
# fun void SetVisiblePolicy(int visiblePolicy, int visibleSlop)
set SCI_SETVISIBLEPOLICY 2394
set prototype(SCI_SETVISIBLEPOLICY) {void {int visiblePolicy, int visibleSlop}}

# Delete back from the current position to the start of the line.
# fun void DelLineLeft(,)
set SCI_DELLINELEFT 2395
set prototype(SCI_DELLINELEFT) {void ,}

# Delete forwards from the current position to the end of the line.
# fun void DelLineRight(,)
set SCI_DELLINERIGHT 2396
set prototype(SCI_DELLINERIGHT) {void ,}

# Get and Set the xOffset (ie, horizontal scroll position).
# set void SetXOffset(int newOffset,)
set SCI_SETXOFFSET 2397
set prototype(SCI_SETXOFFSET) {void {int newOffset,}}
# get int GetXOffset(,)
set SCI_GETXOFFSET 2398
set prototype(SCI_GETXOFFSET) {int ,}

# Set the last x chosen value to be the caret x position.
# fun void ChooseCaretX(,)
set SCI_CHOOSECARETX 2399
set prototype(SCI_CHOOSECARETX) {void ,}

# Set the focus to this Scintilla widget.
# fun void GrabFocus(,)
set SCI_GRABFOCUS 2400
set prototype(SCI_GRABFOCUS) {void ,}

lappend enums(CaretPolicy) CARET_
# Caret policy, used by SetXCaretPolicy and SetYCaretPolicy.
# If CARET_SLOP is set, we can define a slop value: caretSlop.
# This value defines an unwanted zone (UZ) where the caret is... unwanted.
# This zone is defined as a number of pixels near the vertical margins,
# and as a number of lines near the horizontal margins.
# By keeping the caret away from the edges, it is seen within its context,
# so it is likely that the identifier that the caret is on can be completely seen,
# and that the current line is seen with some of the lines following it which are
# often dependent on that line.
set CARET_SLOP 0x01
# If CARET_STRICT is set, the policy is enforced... strictly.
# The caret is centred on the display if slop is not set,
# and cannot go in the UZ if slop is set.
set CARET_STRICT 0x04
# If CARET_JUMPS is set, the display is moved more energetically
# so the caret can move in the same direction longer before the policy is applied again.
set CARET_JUMPS 0x10
# If CARET_EVEN is not set, instead of having symmetrical UZs,
# the left and bottom UZs are extended up to right and top UZs respectively.
# This way, we favour the displaying of useful information: the beginning of lines,
# where most code reside, and the lines after the caret, eg. the body of a function.
set CARET_EVEN 0x08

# Set the way the caret is kept visible when going sideways.
# The exclusion zone is given in pixels.
# fun void SetXCaretPolicy(int caretPolicy, int caretSlop)
set SCI_SETXCARETPOLICY 2402
set prototype(SCI_SETXCARETPOLICY) {void {int caretPolicy, int caretSlop}}

# Set the way the line the caret is on is kept visible.
# The exclusion zone is given in lines.
# fun void SetYCaretPolicy(int caretPolicy, int caretSlop)
set SCI_SETYCARETPOLICY 2403
set prototype(SCI_SETYCARETPOLICY) {void {int caretPolicy, int caretSlop}}

# Set printing to line wrapped (SC_WRAP_WORD) or not line wrapped (SC_WRAP_NONE).
# set void SetPrintWrapMode(int mode,)
set SCI_SETPRINTWRAPMODE 2406
set prototype(SCI_SETPRINTWRAPMODE) {void {int mode,}}

# Is printing line wrapped?
# get int GetPrintWrapMode(,)
set SCI_GETPRINTWRAPMODE 2407
set prototype(SCI_GETPRINTWRAPMODE) {int ,}

# Set a fore colour for active hotspots.
# set void SetHotspotActiveFore(bool useSetting, colour fore)
set SCI_SETHOTSPOTACTIVEFORE 2410
set prototype(SCI_SETHOTSPOTACTIVEFORE) {void {bool useSetting, colour fore}}

# Get the fore colour for active hotspots.
# get colour GetHotspotActiveFore(,)
set SCI_GETHOTSPOTACTIVEFORE 2494
set prototype(SCI_GETHOTSPOTACTIVEFORE) {colour ,}

# Set a back colour for active hotspots.
# set void SetHotspotActiveBack(bool useSetting, colour back)
set SCI_SETHOTSPOTACTIVEBACK 2411
set prototype(SCI_SETHOTSPOTACTIVEBACK) {void {bool useSetting, colour back}}

# Get the back colour for active hotspots.
# get colour GetHotspotActiveBack(,)
set SCI_GETHOTSPOTACTIVEBACK 2495
set prototype(SCI_GETHOTSPOTACTIVEBACK) {colour ,}

# Enable / Disable underlining active hotspots.
# set void SetHotspotActiveUnderline(bool underline,)
set SCI_SETHOTSPOTACTIVEUNDERLINE 2412
set prototype(SCI_SETHOTSPOTACTIVEUNDERLINE) {void {bool underline,}}

# Get whether underlining for active hotspots.
# get bool GetHotspotActiveUnderline(,)
set SCI_GETHOTSPOTACTIVEUNDERLINE 2496
set prototype(SCI_GETHOTSPOTACTIVEUNDERLINE) {bool ,}

# Limit hotspots to single line so hotspots on two lines don't merge.
# set void SetHotspotSingleLine(bool singleLine,)
set SCI_SETHOTSPOTSINGLELINE 2421
set prototype(SCI_SETHOTSPOTSINGLELINE) {void {bool singleLine,}}

# Get the HotspotSingleLine property
# get bool GetHotspotSingleLine(,)
set SCI_GETHOTSPOTSINGLELINE 2497
set prototype(SCI_GETHOTSPOTSINGLELINE) {bool ,}

# Move caret between paragraphs (delimited by empty lines).
# fun void ParaDown(,)
set SCI_PARADOWN 2413
set prototype(SCI_PARADOWN) {void ,}
# fun void ParaDownExtend(,)
set SCI_PARADOWNEXTEND 2414
set prototype(SCI_PARADOWNEXTEND) {void ,}
# fun void ParaUp(,)
set SCI_PARAUP 2415
set prototype(SCI_PARAUP) {void ,}
# fun void ParaUpExtend(,)
set SCI_PARAUPEXTEND 2416
set prototype(SCI_PARAUPEXTEND) {void ,}

# Given a valid document position, return the previous position taking code
# page into account. Returns 0 if passed 0.
# fun position PositionBefore(position pos,)
set SCI_POSITIONBEFORE 2417
set prototype(SCI_POSITIONBEFORE) {position {position pos,}}

# Given a valid document position, return the next position taking code
# page into account. Maximum value returned is the last position in the document.
# fun position PositionAfter(position pos,)
set SCI_POSITIONAFTER 2418
set prototype(SCI_POSITIONAFTER) {position {position pos,}}

# Given a valid document position, return a position that differs in a number
# of characters. Returned value is always between 0 and last position in document.
# fun position PositionRelative(position pos, int relative)
set SCI_POSITIONRELATIVE 2670
set prototype(SCI_POSITIONRELATIVE) {position {position pos, int relative}}

# Copy a range of text to the clipboard. Positions are clipped into the document.
# fun void CopyRange(position start, position end)
set SCI_COPYRANGE 2419
set prototype(SCI_COPYRANGE) {void {position start, position end}}

# Copy argument text to the clipboard.
# fun void CopyText(int length, string text)
set SCI_COPYTEXT 2420
set prototype(SCI_COPYTEXT) {void {int length, string text}}

lappend enums(SelectionMode) SC_SEL_
set SC_SEL_STREAM 0
set SC_SEL_RECTANGLE 1
set SC_SEL_LINES 2
set SC_SEL_THIN 3

# Set the selection mode to stream (SC_SEL_STREAM) or rectangular (SC_SEL_RECTANGLE/SC_SEL_THIN) or
# by lines (SC_SEL_LINES).
# set void SetSelectionMode(int mode,)
set SCI_SETSELECTIONMODE 2422
set prototype(SCI_SETSELECTIONMODE) {void {int mode,}}

# Get the mode of the current selection.
# get int GetSelectionMode(,)
set SCI_GETSELECTIONMODE 2423
set prototype(SCI_GETSELECTIONMODE) {int ,}

# Retrieve the position of the start of the selection at the given line (INVALID_POSITION if no selection on this line).
# fun position GetLineSelStartPosition(int line,)
set SCI_GETLINESELSTARTPOSITION 2424
set prototype(SCI_GETLINESELSTARTPOSITION) {position {int line,}}

# Retrieve the position of the end of the selection at the given line (INVALID_POSITION if no selection on this line).
# fun position GetLineSelEndPosition(int line,)
set SCI_GETLINESELENDPOSITION 2425
set prototype(SCI_GETLINESELENDPOSITION) {position {int line,}}

# Move caret down one line, extending rectangular selection to new caret position.
# fun void LineDownRectExtend(,)
set SCI_LINEDOWNRECTEXTEND 2426
set prototype(SCI_LINEDOWNRECTEXTEND) {void ,}

# Move caret up one line, extending rectangular selection to new caret position.
# fun void LineUpRectExtend(,)
set SCI_LINEUPRECTEXTEND 2427
set prototype(SCI_LINEUPRECTEXTEND) {void ,}

# Move caret left one character, extending rectangular selection to new caret position.
# fun void CharLeftRectExtend(,)
set SCI_CHARLEFTRECTEXTEND 2428
set prototype(SCI_CHARLEFTRECTEXTEND) {void ,}

# Move caret right one character, extending rectangular selection to new caret position.
# fun void CharRightRectExtend(,)
set SCI_CHARRIGHTRECTEXTEND 2429
set prototype(SCI_CHARRIGHTRECTEXTEND) {void ,}

# Move caret to first position on line, extending rectangular selection to new caret position.
# fun void HomeRectExtend(,)
set SCI_HOMERECTEXTEND 2430
set prototype(SCI_HOMERECTEXTEND) {void ,}

# Move caret to before first visible character on line.
# If already there move to first character on line.
# In either case, extend rectangular selection to new caret position.
# fun void VCHomeRectExtend(,)
set SCI_VCHOMERECTEXTEND 2431
set prototype(SCI_VCHOMERECTEXTEND) {void ,}

# Move caret to last position on line, extending rectangular selection to new caret position.
# fun void LineEndRectExtend(,)
set SCI_LINEENDRECTEXTEND 2432
set prototype(SCI_LINEENDRECTEXTEND) {void ,}

# Move caret one page up, extending rectangular selection to new caret position.
# fun void PageUpRectExtend(,)
set SCI_PAGEUPRECTEXTEND 2433
set prototype(SCI_PAGEUPRECTEXTEND) {void ,}

# Move caret one page down, extending rectangular selection to new caret position.
# fun void PageDownRectExtend(,)
set SCI_PAGEDOWNRECTEXTEND 2434
set prototype(SCI_PAGEDOWNRECTEXTEND) {void ,}

# Move caret to top of page, or one page up if already at top of page.
# fun void StutteredPageUp(,)
set SCI_STUTTEREDPAGEUP 2435
set prototype(SCI_STUTTEREDPAGEUP) {void ,}

# Move caret to top of page, or one page up if already at top of page, extending selection to new caret position.
# fun void StutteredPageUpExtend(,)
set SCI_STUTTEREDPAGEUPEXTEND 2436
set prototype(SCI_STUTTEREDPAGEUPEXTEND) {void ,}

# Move caret to bottom of page, or one page down if already at bottom of page.
# fun void StutteredPageDown(,)
set SCI_STUTTEREDPAGEDOWN 2437
set prototype(SCI_STUTTEREDPAGEDOWN) {void ,}

# Move caret to bottom of page, or one page down if already at bottom of page, extending selection to new caret position.
# fun void StutteredPageDownExtend(,)
set SCI_STUTTEREDPAGEDOWNEXTEND 2438
set prototype(SCI_STUTTEREDPAGEDOWNEXTEND) {void ,}

# Move caret left one word, position cursor at end of word.
# fun void WordLeftEnd(,)
set SCI_WORDLEFTEND 2439
set prototype(SCI_WORDLEFTEND) {void ,}

# Move caret left one word, position cursor at end of word, extending selection to new caret position.
# fun void WordLeftEndExtend(,)
set SCI_WORDLEFTENDEXTEND 2440
set prototype(SCI_WORDLEFTENDEXTEND) {void ,}

# Move caret right one word, position cursor at end of word.
# fun void WordRightEnd(,)
set SCI_WORDRIGHTEND 2441
set prototype(SCI_WORDRIGHTEND) {void ,}

# Move caret right one word, position cursor at end of word, extending selection to new caret position.
# fun void WordRightEndExtend(,)
set SCI_WORDRIGHTENDEXTEND 2442
set prototype(SCI_WORDRIGHTENDEXTEND) {void ,}

# Set the set of characters making up whitespace for when moving or selecting by word.
# Should be called after SetWordChars.
# set void SetWhitespaceChars(, string characters)
set SCI_SETWHITESPACECHARS 2443
set prototype(SCI_SETWHITESPACECHARS) {void {, string characters}}

# Get the set of characters making up whitespace for when moving or selecting by word.
# get int GetWhitespaceChars(, stringresult characters)
set SCI_GETWHITESPACECHARS 2647
set prototype(SCI_GETWHITESPACECHARS) {int {, stringresult characters}}

# Set the set of characters making up punctuation characters
# Should be called after SetWordChars.
# set void SetPunctuationChars(, string characters)
set SCI_SETPUNCTUATIONCHARS 2648
set prototype(SCI_SETPUNCTUATIONCHARS) {void {, string characters}}

# Get the set of characters making up punctuation characters
# get int GetPunctuationChars(, stringresult characters)
set SCI_GETPUNCTUATIONCHARS 2649
set prototype(SCI_GETPUNCTUATIONCHARS) {int {, stringresult characters}}

# Reset the set of characters for whitespace and word characters to the defaults.
# fun void SetCharsDefault(,)
set SCI_SETCHARSDEFAULT 2444
set prototype(SCI_SETCHARSDEFAULT) {void ,}

# Get currently selected item position in the auto-completion list
# get int AutoCGetCurrent(,)
set SCI_AUTOCGETCURRENT 2445
set prototype(SCI_AUTOCGETCURRENT) {int ,}

# Get currently selected item text in the auto-completion list
# Returns the length of the item text
# Result is NUL-terminated.
# get int AutoCGetCurrentText(, stringresult s)
set SCI_AUTOCGETCURRENTTEXT 2610
set prototype(SCI_AUTOCGETCURRENTTEXT) {int {, stringresult s}}

lappend enums(CaseInsensitiveBehaviour) SC_CASEINSENSITIVEBEHAVIOUR_
set SC_CASEINSENSITIVEBEHAVIOUR_RESPECTCASE 0
set SC_CASEINSENSITIVEBEHAVIOUR_IGNORECASE 1

# Set auto-completion case insensitive behaviour to either prefer case-sensitive matches or have no preference.
# set void AutoCSetCaseInsensitiveBehaviour(int behaviour,)
set SCI_AUTOCSETCASEINSENSITIVEBEHAVIOUR 2634
set prototype(SCI_AUTOCSETCASEINSENSITIVEBEHAVIOUR) {void {int behaviour,}}

# Get auto-completion case insensitive behaviour.
# get int AutoCGetCaseInsensitiveBehaviour(,)
set SCI_AUTOCGETCASEINSENSITIVEBEHAVIOUR 2635
set prototype(SCI_AUTOCGETCASEINSENSITIVEBEHAVIOUR) {int ,}

lappend enums(MultiAutoComplete) SC_MULTIAUTOC_
set SC_MULTIAUTOC_ONCE 0
set SC_MULTIAUTOC_EACH 1

# Change the effect of autocompleting when there are multiple selections.
# set void AutoCSetMulti(int multi,)
set SCI_AUTOCSETMULTI 2636
set prototype(SCI_AUTOCSETMULTI) {void {int multi,}}

# Retrieve the effect of autocompleting when there are multiple selections.
# get int AutoCGetMulti(,)
set SCI_AUTOCGETMULTI 2637
set prototype(SCI_AUTOCGETMULTI) {int ,}

lappend enums(Ordering) SC_ORDER_
set SC_ORDER_PRESORTED 0
set SC_ORDER_PERFORMSORT 1
set SC_ORDER_CUSTOM 2

# Set the way autocompletion lists are ordered.
# set void AutoCSetOrder(int order,)
set SCI_AUTOCSETORDER 2660
set prototype(SCI_AUTOCSETORDER) {void {int order,}}

# Get the way autocompletion lists are ordered.
# get int AutoCGetOrder(,)
set SCI_AUTOCGETORDER 2661
set prototype(SCI_AUTOCGETORDER) {int ,}

# Enlarge the document to a particular size of text bytes.
# fun void Allocate(int bytes,)
set SCI_ALLOCATE 2446
set prototype(SCI_ALLOCATE) {void {int bytes,}}

# Returns the target converted to UTF8.
# Return the length in bytes.
# fun int TargetAsUTF8(, stringresult s)
set SCI_TARGETASUTF8 2447
set prototype(SCI_TARGETASUTF8) {int {, stringresult s}}

# Set the length of the utf8 argument for calling EncodedFromUTF8.
# Set to -1 and the string will be measured to the first nul.
# fun void SetLengthForEncode(int bytes,)
set SCI_SETLENGTHFORENCODE 2448
set prototype(SCI_SETLENGTHFORENCODE) {void {int bytes,}}

# Translates a UTF8 string into the document encoding.
# Return the length of the result in bytes.
# On error return 0.
# fun int EncodedFromUTF8(string utf8, stringresult encoded)
set SCI_ENCODEDFROMUTF8 2449
set prototype(SCI_ENCODEDFROMUTF8) {int {string utf8, stringresult encoded}}

# Find the position of a column on a line taking into account tabs and
# multi-byte characters. If beyond end of line, return line end position.
# fun int FindColumn(int line, int column)
set SCI_FINDCOLUMN 2456
set prototype(SCI_FINDCOLUMN) {int {int line, int column}}

# Can the caret preferred x position only be changed by explicit movement commands?
# get int GetCaretSticky(,)
set SCI_GETCARETSTICKY 2457
set prototype(SCI_GETCARETSTICKY) {int ,}

# Stop the caret preferred x position changing when the user types.
# set void SetCaretSticky(int useCaretStickyBehaviour,)
set SCI_SETCARETSTICKY 2458
set prototype(SCI_SETCARETSTICKY) {void {int useCaretStickyBehaviour,}}

lappend enums(CaretSticky) SC_CARETSTICKY_
set SC_CARETSTICKY_OFF 0
set SC_CARETSTICKY_ON 1
set SC_CARETSTICKY_WHITESPACE 2

# Switch between sticky and non-sticky: meant to be bound to a key.
# fun void ToggleCaretSticky(,)
set SCI_TOGGLECARETSTICKY 2459
set prototype(SCI_TOGGLECARETSTICKY) {void ,}

# Enable/Disable convert-on-paste for line endings
# set void SetPasteConvertEndings(bool convert,)
set SCI_SETPASTECONVERTENDINGS 2467
set prototype(SCI_SETPASTECONVERTENDINGS) {void {bool convert,}}

# Get convert-on-paste setting
# get bool GetPasteConvertEndings(,)
set SCI_GETPASTECONVERTENDINGS 2468
set prototype(SCI_GETPASTECONVERTENDINGS) {bool ,}

# Duplicate the selection. If selection empty duplicate the line containing the caret.
# fun void SelectionDuplicate(,)
set SCI_SELECTIONDUPLICATE 2469
set prototype(SCI_SELECTIONDUPLICATE) {void ,}

set SC_ALPHA_TRANSPARENT 0
set SC_ALPHA_OPAQUE 255
set SC_ALPHA_NOALPHA 256

# Set background alpha of the caret line.
# set void SetCaretLineBackAlpha(int alpha,)
set SCI_SETCARETLINEBACKALPHA 2470
set prototype(SCI_SETCARETLINEBACKALPHA) {void {int alpha,}}

# Get the background alpha of the caret line.
# get int GetCaretLineBackAlpha(,)
set SCI_GETCARETLINEBACKALPHA 2471
set prototype(SCI_GETCARETLINEBACKALPHA) {int ,}

lappend enums(CaretStyle) CARETSTYLE_
set CARETSTYLE_INVISIBLE 0
set CARETSTYLE_LINE 1
set CARETSTYLE_BLOCK 2

# Set the style of the caret to be drawn.
# set void SetCaretStyle(int caretStyle,)
set SCI_SETCARETSTYLE 2512
set prototype(SCI_SETCARETSTYLE) {void {int caretStyle,}}

# Returns the current style of the caret.
# get int GetCaretStyle(,)
set SCI_GETCARETSTYLE 2513
set prototype(SCI_GETCARETSTYLE) {int ,}

# Set the indicator used for IndicatorFillRange and IndicatorClearRange
# set void SetIndicatorCurrent(int indicator,)
set SCI_SETINDICATORCURRENT 2500
set prototype(SCI_SETINDICATORCURRENT) {void {int indicator,}}

# Get the current indicator
# get int GetIndicatorCurrent(,)
set SCI_GETINDICATORCURRENT 2501
set prototype(SCI_GETINDICATORCURRENT) {int ,}

# Set the value used for IndicatorFillRange
# set void SetIndicatorValue(int value,)
set SCI_SETINDICATORVALUE 2502
set prototype(SCI_SETINDICATORVALUE) {void {int value,}}

# Get the current indicator value
# get int GetIndicatorValue(,)
set SCI_GETINDICATORVALUE 2503
set prototype(SCI_GETINDICATORVALUE) {int ,}

# Turn a indicator on over a range.
# fun void IndicatorFillRange(int position, int fillLength)
set SCI_INDICATORFILLRANGE 2504
set prototype(SCI_INDICATORFILLRANGE) {void {int position, int fillLength}}

# Turn a indicator off over a range.
# fun void IndicatorClearRange(int position, int clearLength)
set SCI_INDICATORCLEARRANGE 2505
set prototype(SCI_INDICATORCLEARRANGE) {void {int position, int clearLength}}

# Are any indicators present at position?
# fun int IndicatorAllOnFor(int position,)
set SCI_INDICATORALLONFOR 2506
set prototype(SCI_INDICATORALLONFOR) {int {int position,}}

# What value does a particular indicator have at at a position?
# fun int IndicatorValueAt(int indicator, int position)
set SCI_INDICATORVALUEAT 2507
set prototype(SCI_INDICATORVALUEAT) {int {int indicator, int position}}

# Where does a particular indicator start?
# fun int IndicatorStart(int indicator, int position)
set SCI_INDICATORSTART 2508
set prototype(SCI_INDICATORSTART) {int {int indicator, int position}}

# Where does a particular indicator end?
# fun int IndicatorEnd(int indicator, int position)
set SCI_INDICATOREND 2509
set prototype(SCI_INDICATOREND) {int {int indicator, int position}}

# Set number of entries in position cache
# set void SetPositionCache(int size,)
set SCI_SETPOSITIONCACHE 2514
set prototype(SCI_SETPOSITIONCACHE) {void {int size,}}

# How many entries are allocated to the position cache?
# get int GetPositionCache(,)
set SCI_GETPOSITIONCACHE 2515
set prototype(SCI_GETPOSITIONCACHE) {int ,}

# Copy the selection, if selection empty copy the line with the caret
# fun void CopyAllowLine(,)
set SCI_COPYALLOWLINE 2519
set prototype(SCI_COPYALLOWLINE) {void ,}

# Compact the document buffer and return a read-only pointer to the
# characters in the document.
# get int GetCharacterPointer(,)
set SCI_GETCHARACTERPOINTER 2520
set prototype(SCI_GETCHARACTERPOINTER) {int ,}

# Return a read-only pointer to a range of characters in the document.
# May move the gap so that the range is contiguous, but will only move up
# to rangeLength bytes.
# get int GetRangePointer(int position, int rangeLength)
set SCI_GETRANGEPOINTER 2643
set prototype(SCI_GETRANGEPOINTER) {int {int position, int rangeLength}}

# Return a position which, to avoid performance costs, should not be within
# the range of a call to GetRangePointer.
# get position GetGapPosition(,)
set SCI_GETGAPPOSITION 2644
set prototype(SCI_GETGAPPOSITION) {position ,}

# Set the alpha fill colour of the given indicator.
# set void IndicSetAlpha(int indicator, int alpha)
set SCI_INDICSETALPHA 2523
set prototype(SCI_INDICSETALPHA) {void {int indicator, int alpha}}

# Get the alpha fill colour of the given indicator.
# get int IndicGetAlpha(int indicator,)
set SCI_INDICGETALPHA 2524
set prototype(SCI_INDICGETALPHA) {int {int indicator,}}

# Set the alpha outline colour of the given indicator.
# set void IndicSetOutlineAlpha(int indicator, int alpha)
set SCI_INDICSETOUTLINEALPHA 2558
set prototype(SCI_INDICSETOUTLINEALPHA) {void {int indicator, int alpha}}

# Get the alpha outline colour of the given indicator.
# get int IndicGetOutlineAlpha(int indicator,)
set SCI_INDICGETOUTLINEALPHA 2559
set prototype(SCI_INDICGETOUTLINEALPHA) {int {int indicator,}}

# Set extra ascent for each line
# set void SetExtraAscent(int extraAscent,)
set SCI_SETEXTRAASCENT 2525
set prototype(SCI_SETEXTRAASCENT) {void {int extraAscent,}}

# Get extra ascent for each line
# get int GetExtraAscent(,)
set SCI_GETEXTRAASCENT 2526
set prototype(SCI_GETEXTRAASCENT) {int ,}

# Set extra descent for each line
# set void SetExtraDescent(int extraDescent,)
set SCI_SETEXTRADESCENT 2527
set prototype(SCI_SETEXTRADESCENT) {void {int extraDescent,}}

# Get extra descent for each line
# get int GetExtraDescent(,)
set SCI_GETEXTRADESCENT 2528
set prototype(SCI_GETEXTRADESCENT) {int ,}

# Which symbol was defined for markerNumber with MarkerDefine
# fun int MarkerSymbolDefined(int markerNumber,)
set SCI_MARKERSYMBOLDEFINED 2529
set prototype(SCI_MARKERSYMBOLDEFINED) {int {int markerNumber,}}

# Set the text in the text margin for a line
# set void MarginSetText(int line, string text)
set SCI_MARGINSETTEXT 2530
set prototype(SCI_MARGINSETTEXT) {void {int line, string text}}

# Get the text in the text margin for a line
# get int MarginGetText(int line, stringresult text)
set SCI_MARGINGETTEXT 2531
set prototype(SCI_MARGINGETTEXT) {int {int line, stringresult text}}

# Set the style number for the text margin for a line
# set void MarginSetStyle(int line, int style)
set SCI_MARGINSETSTYLE 2532
set prototype(SCI_MARGINSETSTYLE) {void {int line, int style}}

# Get the style number for the text margin for a line
# get int MarginGetStyle(int line,)
set SCI_MARGINGETSTYLE 2533
set prototype(SCI_MARGINGETSTYLE) {int {int line,}}

# Set the style in the text margin for a line
# set void MarginSetStyles(int line, string styles)
set SCI_MARGINSETSTYLES 2534
set prototype(SCI_MARGINSETSTYLES) {void {int line, string styles}}

# Get the styles in the text margin for a line
# get int MarginGetStyles(int line, stringresult styles)
set SCI_MARGINGETSTYLES 2535
set prototype(SCI_MARGINGETSTYLES) {int {int line, stringresult styles}}

# Clear the margin text on all lines
# fun void MarginTextClearAll(,)
set SCI_MARGINTEXTCLEARALL 2536
set prototype(SCI_MARGINTEXTCLEARALL) {void ,}

# Get the start of the range of style numbers used for margin text
# set void MarginSetStyleOffset(int style,)
set SCI_MARGINSETSTYLEOFFSET 2537
set prototype(SCI_MARGINSETSTYLEOFFSET) {void {int style,}}

# Get the start of the range of style numbers used for margin text
# get int MarginGetStyleOffset(,)
set SCI_MARGINGETSTYLEOFFSET 2538
set prototype(SCI_MARGINGETSTYLEOFFSET) {int ,}

lappend enums(MarginOption) SC_MARGINOPTION_
set SC_MARGINOPTION_NONE 0
set SC_MARGINOPTION_SUBLINESELECT 1

# Set the margin options.
# set void SetMarginOptions(int marginOptions,)
set SCI_SETMARGINOPTIONS 2539
set prototype(SCI_SETMARGINOPTIONS) {void {int marginOptions,}}

# Get the margin options.
# get int GetMarginOptions(,)
set SCI_GETMARGINOPTIONS 2557
set prototype(SCI_GETMARGINOPTIONS) {int ,}

# Set the annotation text for a line
# set void AnnotationSetText(int line, string text)
set SCI_ANNOTATIONSETTEXT 2540
set prototype(SCI_ANNOTATIONSETTEXT) {void {int line, string text}}

# Get the annotation text for a line
# get int AnnotationGetText(int line, stringresult text)
set SCI_ANNOTATIONGETTEXT 2541
set prototype(SCI_ANNOTATIONGETTEXT) {int {int line, stringresult text}}

# Set the style number for the annotations for a line
# set void AnnotationSetStyle(int line, int style)
set SCI_ANNOTATIONSETSTYLE 2542
set prototype(SCI_ANNOTATIONSETSTYLE) {void {int line, int style}}

# Get the style number for the annotations for a line
# get int AnnotationGetStyle(int line,)
set SCI_ANNOTATIONGETSTYLE 2543
set prototype(SCI_ANNOTATIONGETSTYLE) {int {int line,}}

# Set the annotation styles for a line
# set void AnnotationSetStyles(int line, string styles)
set SCI_ANNOTATIONSETSTYLES 2544
set prototype(SCI_ANNOTATIONSETSTYLES) {void {int line, string styles}}

# Get the annotation styles for a line
# get int AnnotationGetStyles(int line, stringresult styles)
set SCI_ANNOTATIONGETSTYLES 2545
set prototype(SCI_ANNOTATIONGETSTYLES) {int {int line, stringresult styles}}

# Get the number of annotation lines for a line
# get int AnnotationGetLines(int line,)
set SCI_ANNOTATIONGETLINES 2546
set prototype(SCI_ANNOTATIONGETLINES) {int {int line,}}

# Clear the annotations from all lines
# fun void AnnotationClearAll(,)
set SCI_ANNOTATIONCLEARALL 2547
set prototype(SCI_ANNOTATIONCLEARALL) {void ,}

lappend enums(AnnotationVisible) ANNOTATION_
set ANNOTATION_HIDDEN 0
set ANNOTATION_STANDARD 1
set ANNOTATION_BOXED 2
set ANNOTATION_INDENTED 3

# Set the visibility for the annotations for a view
# set void AnnotationSetVisible(int visible,)
set SCI_ANNOTATIONSETVISIBLE 2548
set prototype(SCI_ANNOTATIONSETVISIBLE) {void {int visible,}}

# Get the visibility for the annotations for a view
# get int AnnotationGetVisible(,)
set SCI_ANNOTATIONGETVISIBLE 2549
set prototype(SCI_ANNOTATIONGETVISIBLE) {int ,}

# Get the start of the range of style numbers used for annotations
# set void AnnotationSetStyleOffset(int style,)
set SCI_ANNOTATIONSETSTYLEOFFSET 2550
set prototype(SCI_ANNOTATIONSETSTYLEOFFSET) {void {int style,}}

# Get the start of the range of style numbers used for annotations
# get int AnnotationGetStyleOffset(,)
set SCI_ANNOTATIONGETSTYLEOFFSET 2551
set prototype(SCI_ANNOTATIONGETSTYLEOFFSET) {int ,}

# Release all extended (>255) style numbers
# fun void ReleaseAllExtendedStyles(,)
set SCI_RELEASEALLEXTENDEDSTYLES 2552
set prototype(SCI_RELEASEALLEXTENDEDSTYLES) {void ,}

# Allocate some extended (>255) style numbers and return the start of the range
# fun int AllocateExtendedStyles(int numberStyles,)
set SCI_ALLOCATEEXTENDEDSTYLES 2553
set prototype(SCI_ALLOCATEEXTENDEDSTYLES) {int {int numberStyles,}}

set UNDO_MAY_COALESCE 1

# Add a container action to the undo stack
# fun void AddUndoAction(int token, int flags)
set SCI_ADDUNDOACTION 2560
set prototype(SCI_ADDUNDOACTION) {void {int token, int flags}}

# Find the position of a character from a point within the window.
# fun position CharPositionFromPoint(int x, int y)
set SCI_CHARPOSITIONFROMPOINT 2561
set prototype(SCI_CHARPOSITIONFROMPOINT) {position {int x, int y}}

# Find the position of a character from a point within the window.
# Return INVALID_POSITION if not close to text.
# fun position CharPositionFromPointClose(int x, int y)
set SCI_CHARPOSITIONFROMPOINTCLOSE 2562
set prototype(SCI_CHARPOSITIONFROMPOINTCLOSE) {position {int x, int y}}

# Set whether switching to rectangular mode while selecting with the mouse is allowed.
# set void SetMouseSelectionRectangularSwitch(bool mouseSelectionRectangularSwitch,)
set SCI_SETMOUSESELECTIONRECTANGULARSWITCH 2668
set prototype(SCI_SETMOUSESELECTIONRECTANGULARSWITCH) {void {bool mouseSelectionRectangularSwitch,}}

# Whether switching to rectangular mode while selecting with the mouse is allowed.
# get bool GetMouseSelectionRectangularSwitch(,)
set SCI_GETMOUSESELECTIONRECTANGULARSWITCH 2669
set prototype(SCI_GETMOUSESELECTIONRECTANGULARSWITCH) {bool ,}

# Set whether multiple selections can be made
# set void SetMultipleSelection(bool multipleSelection,)
set SCI_SETMULTIPLESELECTION 2563
set prototype(SCI_SETMULTIPLESELECTION) {void {bool multipleSelection,}}

# Whether multiple selections can be made
# get bool GetMultipleSelection(,)
set SCI_GETMULTIPLESELECTION 2564
set prototype(SCI_GETMULTIPLESELECTION) {bool ,}

# Set whether typing can be performed into multiple selections
# set void SetAdditionalSelectionTyping(bool additionalSelectionTyping,)
set SCI_SETADDITIONALSELECTIONTYPING 2565
set prototype(SCI_SETADDITIONALSELECTIONTYPING) {void {bool additionalSelectionTyping,}}

# Whether typing can be performed into multiple selections
# get bool GetAdditionalSelectionTyping(,)
set SCI_GETADDITIONALSELECTIONTYPING 2566
set prototype(SCI_GETADDITIONALSELECTIONTYPING) {bool ,}

# Set whether additional carets will blink
# set void SetAdditionalCaretsBlink(bool additionalCaretsBlink,)
set SCI_SETADDITIONALCARETSBLINK 2567
set prototype(SCI_SETADDITIONALCARETSBLINK) {void {bool additionalCaretsBlink,}}

# Whether additional carets will blink
# get bool GetAdditionalCaretsBlink(,)
set SCI_GETADDITIONALCARETSBLINK 2568
set prototype(SCI_GETADDITIONALCARETSBLINK) {bool ,}

# Set whether additional carets are visible
# set void SetAdditionalCaretsVisible(bool additionalCaretsBlink,)
set SCI_SETADDITIONALCARETSVISIBLE 2608
set prototype(SCI_SETADDITIONALCARETSVISIBLE) {void {bool additionalCaretsBlink,}}

# Whether additional carets are visible
# get bool GetAdditionalCaretsVisible(,)
set SCI_GETADDITIONALCARETSVISIBLE 2609
set prototype(SCI_GETADDITIONALCARETSVISIBLE) {bool ,}

# How many selections are there?
# get int GetSelections(,)
set SCI_GETSELECTIONS 2570
set prototype(SCI_GETSELECTIONS) {int ,}

# Is every selected range empty?
# get bool GetSelectionEmpty(,)
set SCI_GETSELECTIONEMPTY 2650
set prototype(SCI_GETSELECTIONEMPTY) {bool ,}

# Clear selections to a single empty stream selection
# fun void ClearSelections(,)
set SCI_CLEARSELECTIONS 2571
set prototype(SCI_CLEARSELECTIONS) {void ,}

# Set a simple selection
# fun int SetSelection(int caret, int anchor)
set SCI_SETSELECTION 2572
set prototype(SCI_SETSELECTION) {int {int caret, int anchor}}

# Add a selection
# fun int AddSelection(int caret, int anchor)
set SCI_ADDSELECTION 2573
set prototype(SCI_ADDSELECTION) {int {int caret, int anchor}}

# Drop one selection
# fun void DropSelectionN(int selection,)
set SCI_DROPSELECTIONN 2671
set prototype(SCI_DROPSELECTIONN) {void {int selection,}}

# Set the main selection
# set void SetMainSelection(int selection,)
set SCI_SETMAINSELECTION 2574
set prototype(SCI_SETMAINSELECTION) {void {int selection,}}

# Which selection is the main selection
# get int GetMainSelection(,)
set SCI_GETMAINSELECTION 2575
set prototype(SCI_GETMAINSELECTION) {int ,}

# set void SetSelectionNCaret(int selection, position pos)
set SCI_SETSELECTIONNCARET 2576
set prototype(SCI_SETSELECTIONNCARET) {void {int selection, position pos}}
# get position GetSelectionNCaret(int selection,)
set SCI_GETSELECTIONNCARET 2577
set prototype(SCI_GETSELECTIONNCARET) {position {int selection,}}
# set void SetSelectionNAnchor(int selection, position posAnchor)
set SCI_SETSELECTIONNANCHOR 2578
set prototype(SCI_SETSELECTIONNANCHOR) {void {int selection, position posAnchor}}
# get position GetSelectionNAnchor(int selection,)
set SCI_GETSELECTIONNANCHOR 2579
set prototype(SCI_GETSELECTIONNANCHOR) {position {int selection,}}
# set void SetSelectionNCaretVirtualSpace(int selection, int space)
set SCI_SETSELECTIONNCARETVIRTUALSPACE 2580
set prototype(SCI_SETSELECTIONNCARETVIRTUALSPACE) {void {int selection, int space}}
# get int GetSelectionNCaretVirtualSpace(int selection,)
set SCI_GETSELECTIONNCARETVIRTUALSPACE 2581
set prototype(SCI_GETSELECTIONNCARETVIRTUALSPACE) {int {int selection,}}
# set void SetSelectionNAnchorVirtualSpace(int selection, int space)
set SCI_SETSELECTIONNANCHORVIRTUALSPACE 2582
set prototype(SCI_SETSELECTIONNANCHORVIRTUALSPACE) {void {int selection, int space}}
# get int GetSelectionNAnchorVirtualSpace(int selection,)
set SCI_GETSELECTIONNANCHORVIRTUALSPACE 2583
set prototype(SCI_GETSELECTIONNANCHORVIRTUALSPACE) {int {int selection,}}

# Sets the position that starts the selection - this becomes the anchor.
# set void SetSelectionNStart(int selection, position pos)
set SCI_SETSELECTIONNSTART 2584
set prototype(SCI_SETSELECTIONNSTART) {void {int selection, position pos}}

# Returns the position at the start of the selection.
# get position GetSelectionNStart(int selection,)
set SCI_GETSELECTIONNSTART 2585
set prototype(SCI_GETSELECTIONNSTART) {position {int selection,}}

# Sets the position that ends the selection - this becomes the currentPosition.
# set void SetSelectionNEnd(int selection, position pos)
set SCI_SETSELECTIONNEND 2586
set prototype(SCI_SETSELECTIONNEND) {void {int selection, position pos}}

# Returns the position at the end of the selection.
# get position GetSelectionNEnd(int selection,)
set SCI_GETSELECTIONNEND 2587
set prototype(SCI_GETSELECTIONNEND) {position {int selection,}}

# set void SetRectangularSelectionCaret(position pos,)
set SCI_SETRECTANGULARSELECTIONCARET 2588
set prototype(SCI_SETRECTANGULARSELECTIONCARET) {void {position pos,}}
# get position GetRectangularSelectionCaret(,)
set SCI_GETRECTANGULARSELECTIONCARET 2589
set prototype(SCI_GETRECTANGULARSELECTIONCARET) {position ,}
# set void SetRectangularSelectionAnchor(position posAnchor,)
set SCI_SETRECTANGULARSELECTIONANCHOR 2590
set prototype(SCI_SETRECTANGULARSELECTIONANCHOR) {void {position posAnchor,}}
# get position GetRectangularSelectionAnchor(,)
set SCI_GETRECTANGULARSELECTIONANCHOR 2591
set prototype(SCI_GETRECTANGULARSELECTIONANCHOR) {position ,}
# set void SetRectangularSelectionCaretVirtualSpace(int space,)
set SCI_SETRECTANGULARSELECTIONCARETVIRTUALSPACE 2592
set prototype(SCI_SETRECTANGULARSELECTIONCARETVIRTUALSPACE) {void {int space,}}
# get int GetRectangularSelectionCaretVirtualSpace(,)
set SCI_GETRECTANGULARSELECTIONCARETVIRTUALSPACE 2593
set prototype(SCI_GETRECTANGULARSELECTIONCARETVIRTUALSPACE) {int ,}
# set void SetRectangularSelectionAnchorVirtualSpace(int space,)
set SCI_SETRECTANGULARSELECTIONANCHORVIRTUALSPACE 2594
set prototype(SCI_SETRECTANGULARSELECTIONANCHORVIRTUALSPACE) {void {int space,}}
# get int GetRectangularSelectionAnchorVirtualSpace(,)
set SCI_GETRECTANGULARSELECTIONANCHORVIRTUALSPACE 2595
set prototype(SCI_GETRECTANGULARSELECTIONANCHORVIRTUALSPACE) {int ,}

lappend enums(VirtualSpace) SCVS_
set SCVS_NONE 0
set SCVS_RECTANGULARSELECTION 1
set SCVS_USERACCESSIBLE 2

# set void SetVirtualSpaceOptions(int virtualSpaceOptions,)
set SCI_SETVIRTUALSPACEOPTIONS 2596
set prototype(SCI_SETVIRTUALSPACEOPTIONS) {void {int virtualSpaceOptions,}}
# get int GetVirtualSpaceOptions(,)
set SCI_GETVIRTUALSPACEOPTIONS 2597
set prototype(SCI_GETVIRTUALSPACEOPTIONS) {int ,}

# On GTK+, allow selecting the modifier key to use for mouse-based
# rectangular selection. Often the window manager requires Alt+Mouse Drag
# for moving windows.
# Valid values are SCMOD_CTRL(default), SCMOD_ALT, or SCMOD_SUPER.

# set void SetRectangularSelectionModifier(int modifier,)
set SCI_SETRECTANGULARSELECTIONMODIFIER 2598
set prototype(SCI_SETRECTANGULARSELECTIONMODIFIER) {void {int modifier,}}

# Get the modifier key used for rectangular selection.
# get int GetRectangularSelectionModifier(,)
set SCI_GETRECTANGULARSELECTIONMODIFIER 2599
set prototype(SCI_GETRECTANGULARSELECTIONMODIFIER) {int ,}

# Set the foreground colour of additional selections.
# Must have previously called SetSelFore with non-zero first argument for this to have an effect.
# set void SetAdditionalSelFore(colour fore,)
set SCI_SETADDITIONALSELFORE 2600
set prototype(SCI_SETADDITIONALSELFORE) {void {colour fore,}}

# Set the background colour of additional selections.
# Must have previously called SetSelBack with non-zero first argument for this to have an effect.
# set void SetAdditionalSelBack(colour back,)
set SCI_SETADDITIONALSELBACK 2601
set prototype(SCI_SETADDITIONALSELBACK) {void {colour back,}}

# Set the alpha of the selection.
# set void SetAdditionalSelAlpha(int alpha,)
set SCI_SETADDITIONALSELALPHA 2602
set prototype(SCI_SETADDITIONALSELALPHA) {void {int alpha,}}

# Get the alpha of the selection.
# get int GetAdditionalSelAlpha(,)
set SCI_GETADDITIONALSELALPHA 2603
set prototype(SCI_GETADDITIONALSELALPHA) {int ,}

# Set the foreground colour of additional carets.
# set void SetAdditionalCaretFore(colour fore,)
set SCI_SETADDITIONALCARETFORE 2604
set prototype(SCI_SETADDITIONALCARETFORE) {void {colour fore,}}

# Get the foreground colour of additional carets.
# get colour GetAdditionalCaretFore(,)
set SCI_GETADDITIONALCARETFORE 2605
set prototype(SCI_GETADDITIONALCARETFORE) {colour ,}

# Set the main selection to the next selection.
# fun void RotateSelection(,)
set SCI_ROTATESELECTION 2606
set prototype(SCI_ROTATESELECTION) {void ,}

# Swap that caret and anchor of the main selection.
# fun void SwapMainAnchorCaret(,)
set SCI_SWAPMAINANCHORCARET 2607
set prototype(SCI_SWAPMAINANCHORCARET) {void ,}

# Add the next occurrence of the main selection to the set of selections as main.
# If the current selection is empty then select word around caret.
# fun void MultipleSelectAddNext(,)
set SCI_MULTIPLESELECTADDNEXT 2688
set prototype(SCI_MULTIPLESELECTADDNEXT) {void ,}

# Add each occurrence of the main selection in the target to the set of selections.
# If the current selection is empty then select word around caret.
# fun void MultipleSelectAddEach(,)
set SCI_MULTIPLESELECTADDEACH 2689
set prototype(SCI_MULTIPLESELECTADDEACH) {void ,}

# Indicate that the internal state of a lexer has changed over a range and therefore
# there may be a need to redraw.
# fun int ChangeLexerState(position start, position end)
set SCI_CHANGELEXERSTATE 2617
set prototype(SCI_CHANGELEXERSTATE) {int {position start, position end}}

# Find the next line at or after lineStart that is a contracted fold header line.
# Return -1 when no more lines.
# fun int ContractedFoldNext(int lineStart,)
set SCI_CONTRACTEDFOLDNEXT 2618
set prototype(SCI_CONTRACTEDFOLDNEXT) {int {int lineStart,}}

# Centre current line in window.
# fun void VerticalCentreCaret(,)
set SCI_VERTICALCENTRECARET 2619
set prototype(SCI_VERTICALCENTRECARET) {void ,}

# Move the selected lines up one line, shifting the line above after the selection
# fun void MoveSelectedLinesUp(,)
set SCI_MOVESELECTEDLINESUP 2620
set prototype(SCI_MOVESELECTEDLINESUP) {void ,}

# Move the selected lines down one line, shifting the line below before the selection
# fun void MoveSelectedLinesDown(,)
set SCI_MOVESELECTEDLINESDOWN 2621
set prototype(SCI_MOVESELECTEDLINESDOWN) {void ,}

# Set the identifier reported as idFrom in notification messages.
# set void SetIdentifier(int identifier,)
set SCI_SETIDENTIFIER 2622
set prototype(SCI_SETIDENTIFIER) {void {int identifier,}}

# Get the identifier.
# get int GetIdentifier(,)
set SCI_GETIDENTIFIER 2623
set prototype(SCI_GETIDENTIFIER) {int ,}

# Set the width for future RGBA image data.
# set void RGBAImageSetWidth(int width,)
set SCI_RGBAIMAGESETWIDTH 2624
set prototype(SCI_RGBAIMAGESETWIDTH) {void {int width,}}

# Set the height for future RGBA image data.
# set void RGBAImageSetHeight(int height,)
set SCI_RGBAIMAGESETHEIGHT 2625
set prototype(SCI_RGBAIMAGESETHEIGHT) {void {int height,}}

# Set the scale factor in percent for future RGBA image data.
# set void RGBAImageSetScale(int scalePercent,)
set SCI_RGBAIMAGESETSCALE 2651
set prototype(SCI_RGBAIMAGESETSCALE) {void {int scalePercent,}}

# Define a marker from RGBA data.
# It has the width and height from RGBAImageSetWidth/Height
# fun void MarkerDefineRGBAImage(int markerNumber, string pixels)
set SCI_MARKERDEFINERGBAIMAGE 2626
set prototype(SCI_MARKERDEFINERGBAIMAGE) {void {int markerNumber, string pixels}}

# Register an RGBA image for use in autocompletion lists.
# It has the width and height from RGBAImageSetWidth/Height
# fun void RegisterRGBAImage(int type, string pixels)
set SCI_REGISTERRGBAIMAGE 2627
set prototype(SCI_REGISTERRGBAIMAGE) {void {int type, string pixels}}

# Scroll to start of document.
# fun void ScrollToStart(,)
set SCI_SCROLLTOSTART 2628
set prototype(SCI_SCROLLTOSTART) {void ,}

# Scroll to end of document.
# fun void ScrollToEnd(,)
set SCI_SCROLLTOEND 2629
set prototype(SCI_SCROLLTOEND) {void ,}

set SC_TECHNOLOGY_DEFAULT 0
set SC_TECHNOLOGY_DIRECTWRITE 1
set SC_TECHNOLOGY_DIRECTWRITERETAIN 2
set SC_TECHNOLOGY_DIRECTWRITEDC 3

# Set the technology used.
# set void SetTechnology(int technology,)
set SCI_SETTECHNOLOGY 2630
set prototype(SCI_SETTECHNOLOGY) {void {int technology,}}

# Get the tech.
# get int GetTechnology(,)
set SCI_GETTECHNOLOGY 2631
set prototype(SCI_GETTECHNOLOGY) {int ,}

# Create an ILoader*.
# fun int CreateLoader(int bytes,)
set SCI_CREATELOADER 2632
set prototype(SCI_CREATELOADER) {int {int bytes,}}

# On OS X, show a find indicator.
# fun void FindIndicatorShow(position start, position end)
set SCI_FINDINDICATORSHOW 2640
set prototype(SCI_FINDINDICATORSHOW) {void {position start, position end}}

# On OS X, flash a find indicator, then fade out.
# fun void FindIndicatorFlash(position start, position end)
set SCI_FINDINDICATORFLASH 2641
set prototype(SCI_FINDINDICATORFLASH) {void {position start, position end}}

# On OS X, hide the find indicator.
# fun void FindIndicatorHide(,)
set SCI_FINDINDICATORHIDE 2642
set prototype(SCI_FINDINDICATORHIDE) {void ,}

# Move caret to before first visible character on display line.
# If already there move to first character on display line.
# fun void VCHomeDisplay(,)
set SCI_VCHOMEDISPLAY 2652
set prototype(SCI_VCHOMEDISPLAY) {void ,}

# Like VCHomeDisplay but extending selection to new caret position.
# fun void VCHomeDisplayExtend(,)
set SCI_VCHOMEDISPLAYEXTEND 2653
set prototype(SCI_VCHOMEDISPLAYEXTEND) {void ,}

# Is the caret line always visible?
# get bool GetCaretLineVisibleAlways(,)
set SCI_GETCARETLINEVISIBLEALWAYS 2654
set prototype(SCI_GETCARETLINEVISIBLEALWAYS) {bool ,}

# Sets the caret line to always visible.
# set void SetCaretLineVisibleAlways(bool alwaysVisible,)
set SCI_SETCARETLINEVISIBLEALWAYS 2655
set prototype(SCI_SETCARETLINEVISIBLEALWAYS) {void {bool alwaysVisible,}}

# Line end types which may be used in addition to LF, CR, and CRLF
# SC_LINE_END_TYPE_UNICODE includes U+2028 Line Separator,
# U+2029 Paragraph Separator, and U+0085 Next Line
lappend enums(LineEndType) SC_LINE_END_TYPE_
set SC_LINE_END_TYPE_DEFAULT 0
set SC_LINE_END_TYPE_UNICODE 1

# Set the line end types that the application wants to use. May not be used if incompatible with lexer or encoding.
# set void SetLineEndTypesAllowed(int lineEndBitSet,)
set SCI_SETLINEENDTYPESALLOWED 2656
set prototype(SCI_SETLINEENDTYPESALLOWED) {void {int lineEndBitSet,}}

# Get the line end types currently allowed.
# get int GetLineEndTypesAllowed(,)
set SCI_GETLINEENDTYPESALLOWED 2657
set prototype(SCI_GETLINEENDTYPESALLOWED) {int ,}

# Get the line end types currently recognised. May be a subset of the allowed types due to lexer limitation.
# get int GetLineEndTypesActive(,)
set SCI_GETLINEENDTYPESACTIVE 2658
set prototype(SCI_GETLINEENDTYPESACTIVE) {int ,}

# Set the way a character is drawn.
# set void SetRepresentation(string encodedCharacter, string representation)
set SCI_SETREPRESENTATION 2665
set prototype(SCI_SETREPRESENTATION) {void {string encodedCharacter, string representation}}

# Set the way a character is drawn.
# Result is NUL-terminated.
# get int GetRepresentation(string encodedCharacter, stringresult representation)
set SCI_GETREPRESENTATION 2666
set prototype(SCI_GETREPRESENTATION) {int {string encodedCharacter, stringresult representation}}

# Remove a character representation.
# fun void ClearRepresentation(string encodedCharacter,)
set SCI_CLEARREPRESENTATION 2667
set prototype(SCI_CLEARREPRESENTATION) {void {string encodedCharacter,}}

# Start notifying the container of all key presses and commands.
# fun void StartRecord(,)
set SCI_STARTRECORD 3001
set prototype(SCI_STARTRECORD) {void ,}

# Stop notifying the container of all key presses and commands.
# fun void StopRecord(,)
set SCI_STOPRECORD 3002
set prototype(SCI_STOPRECORD) {void ,}

# Set the lexing language of the document.
# set void SetLexer(int lexer,)
set SCI_SETLEXER 4001
set prototype(SCI_SETLEXER) {void {int lexer,}}

# Retrieve the lexing language of the document.
# get int GetLexer(,)
set SCI_GETLEXER 4002
set prototype(SCI_GETLEXER) {int ,}

# Colourise a segment of the document using the current lexing language.
# fun void Colourise(position start, position end)
set SCI_COLOURISE 4003
set prototype(SCI_COLOURISE) {void {position start, position end}}

# Set up a value that may be used by a lexer for some optional feature.
# set void SetProperty(string key, string value)
set SCI_SETPROPERTY 4004
set prototype(SCI_SETPROPERTY) {void {string key, string value}}

# Maximum value of keywordSet parameter of SetKeyWords.
set KEYWORDSET_MAX 8

# Set up the key words used by the lexer.
# set void SetKeyWords(int keywordSet, string keyWords)
set SCI_SETKEYWORDS 4005
set prototype(SCI_SETKEYWORDS) {void {int keywordSet, string keyWords}}

# Set the lexing language of the document based on string name.
# set void SetLexerLanguage(, string language)
set SCI_SETLEXERLANGUAGE 4006
set prototype(SCI_SETLEXERLANGUAGE) {void {, string language}}

# Load a lexer library (dll / so).
# fun void LoadLexerLibrary(, string path)
set SCI_LOADLEXERLIBRARY 4007
set prototype(SCI_LOADLEXERLIBRARY) {void {, string path}}

# Retrieve a "property" value previously set with SetProperty.
# Result is NUL-terminated.
# get int GetProperty(string key, stringresult buf)
set SCI_GETPROPERTY 4008
set prototype(SCI_GETPROPERTY) {int {string key, stringresult buf}}

# Retrieve a "property" value previously set with SetProperty,
# with "$()" variable replacement on returned buffer.
# Result is NUL-terminated.
# get int GetPropertyExpanded(string key, stringresult buf)
set SCI_GETPROPERTYEXPANDED 4009
set prototype(SCI_GETPROPERTYEXPANDED) {int {string key, stringresult buf}}

# Retrieve a "property" value previously set with SetProperty,
# interpreted as an int AFTER any "$()" variable replacement.
# get int GetPropertyInt(string key,)
set SCI_GETPROPERTYINT 4010
set prototype(SCI_GETPROPERTYINT) {int {string key,}}

# Retrieve the number of bits the current lexer needs for styling.
# get int GetStyleBitsNeeded(,)
set SCI_GETSTYLEBITSNEEDED 4011
set prototype(SCI_GETSTYLEBITSNEEDED) {int ,}

# Retrieve the name of the lexer.
# Return the length of the text.
# Result is NUL-terminated.
# get int GetLexerLanguage(, stringresult text)
set SCI_GETLEXERLANGUAGE 4012
set prototype(SCI_GETLEXERLANGUAGE) {int {, stringresult text}}

# For private communication between an application and a known lexer.
# fun int PrivateLexerCall(int operation, int pointer)
set SCI_PRIVATELEXERCALL 4013
set prototype(SCI_PRIVATELEXERCALL) {int {int operation, int pointer}}

# Retrieve a '\n' separated list of properties understood by the current lexer.
# Result is NUL-terminated.
# fun int PropertyNames(, stringresult names)
set SCI_PROPERTYNAMES 4014
set prototype(SCI_PROPERTYNAMES) {int {, stringresult names}}

lappend enums(TypeProperty) SC_TYPE_
set SC_TYPE_BOOLEAN 0
set SC_TYPE_INTEGER 1
set SC_TYPE_STRING 2

# Retrieve the type of a property.
# fun int PropertyType(string name,)
set SCI_PROPERTYTYPE 4015
set prototype(SCI_PROPERTYTYPE) {int {string name,}}

# Describe a property.
# Result is NUL-terminated.
# fun int DescribeProperty(string name, stringresult description)
set SCI_DESCRIBEPROPERTY 4016
set prototype(SCI_DESCRIBEPROPERTY) {int {string name, stringresult description}}

# Retrieve a '\n' separated list of descriptions of the keyword sets understood by the current lexer.
# Result is NUL-terminated.
# fun int DescribeKeyWordSets(, stringresult descriptions)
set SCI_DESCRIBEKEYWORDSETS 4017
set prototype(SCI_DESCRIBEKEYWORDSETS) {int {, stringresult descriptions}}

# Bit set of LineEndType enumertion for which line ends beyond the standard
# LF, CR, and CRLF are supported by the lexer.
# get int GetLineEndTypesSupported(,)
set SCI_GETLINEENDTYPESSUPPORTED 4018
set prototype(SCI_GETLINEENDTYPESSUPPORTED) {int ,}

# Allocate a set of sub styles for a particular base style, returning start of range
# fun int AllocateSubStyles(int styleBase, int numberStyles)
set SCI_ALLOCATESUBSTYLES 4020
set prototype(SCI_ALLOCATESUBSTYLES) {int {int styleBase, int numberStyles}}

# The starting style number for the sub styles associated with a base style
# get int GetSubStylesStart(int styleBase,)
set SCI_GETSUBSTYLESSTART 4021
set prototype(SCI_GETSUBSTYLESSTART) {int {int styleBase,}}

# The number of sub styles associated with a base style
# get int GetSubStylesLength(int styleBase,)
set SCI_GETSUBSTYLESLENGTH 4022
set prototype(SCI_GETSUBSTYLESLENGTH) {int {int styleBase,}}

# For a sub style, return the base style, else return the argument.
# get int GetStyleFromSubStyle(int subStyle,)
set SCI_GETSTYLEFROMSUBSTYLE 4027
set prototype(SCI_GETSTYLEFROMSUBSTYLE) {int {int subStyle,}}

# For a secondary style, return the primary style, else return the argument.
# get int GetPrimaryStyleFromStyle(int style,)
set SCI_GETPRIMARYSTYLEFROMSTYLE 4028
set prototype(SCI_GETPRIMARYSTYLEFROMSTYLE) {int {int style,}}

# Free allocated sub styles
# fun void FreeSubStyles(,)
set SCI_FREESUBSTYLES 4023
set prototype(SCI_FREESUBSTYLES) {void ,}

# Set the identifiers that are shown in a particular style
# set void SetIdentifiers(int style, string identifiers)
set SCI_SETIDENTIFIERS 4024
set prototype(SCI_SETIDENTIFIERS) {void {int style, string identifiers}}

# Where styles are duplicated by a feature such as active/inactive code
# return the distance between the two types.
# get int DistanceToSecondaryStyles(,)
set SCI_DISTANCETOSECONDARYSTYLES 4025
set prototype(SCI_DISTANCETOSECONDARYSTYLES) {int ,}

# Get the set of base styles that can be extended with sub styles
# Result is NUL-terminated.
# get int GetSubStyleBases(, stringresult styles)
set SCI_GETSUBSTYLEBASES 4026
set prototype(SCI_GETSUBSTYLEBASES) {int {, stringresult styles}}

# Notifications
# Type of modification and the action which caused the modification.
# These are defined as a bit mask to make it easy to specify which notifications are wanted.
# One bit is set from each of SC_MOD_* and SC_PERFORMED_*.
lappend enums(ModificationFlags) SC_MOD_ SC_PERFORMED_ SC_MULTISTEPUNDOREDO SC_LASTSTEPINUNDOREDO SC_MULTILINEUNDOREDO SC_STARTACTION SC_MODEVENTMASKALL
set SC_MOD_INSERTTEXT 0x1
set SC_MOD_DELETETEXT 0x2
set SC_MOD_CHANGESTYLE 0x4
set SC_MOD_CHANGEFOLD 0x8
set SC_PERFORMED_USER 0x10
set SC_PERFORMED_UNDO 0x20
set SC_PERFORMED_REDO 0x40
set SC_MULTISTEPUNDOREDO 0x80
set SC_LASTSTEPINUNDOREDO 0x100
set SC_MOD_CHANGEMARKER 0x200
set SC_MOD_BEFOREINSERT 0x400
set SC_MOD_BEFOREDELETE 0x800
set SC_MULTILINEUNDOREDO 0x1000
set SC_STARTACTION 0x2000
set SC_MOD_CHANGEINDICATOR 0x4000
set SC_MOD_CHANGELINESTATE 0x8000
set SC_MOD_CHANGEMARGIN 0x10000
set SC_MOD_CHANGEANNOTATION 0x20000
set SC_MOD_CONTAINER 0x40000
set SC_MOD_LEXERSTATE 0x80000
set SC_MOD_INSERTCHECK 0x100000
set SC_MOD_CHANGETABSTOPS 0x200000
set SC_MODEVENTMASKALL 0x3FFFFF

lappend enums(Update) SC_UPDATE_
set SC_UPDATE_CONTENT 0x1
set SC_UPDATE_SELECTION 0x2
set SC_UPDATE_V_SCROLL 0x4
set SC_UPDATE_H_SCROLL 0x8

# For compatibility, these go through the COMMAND notification rather than NOTIFY
# and should have had exactly the same values as the EN_* constants.
# Unfortunately the SETFOCUS and KILLFOCUS are flipped over from EN_*
# As clients depend on these constants, this will not be changed.
set SCEN_CHANGE 768
set SCEN_SETFOCUS 512
set SCEN_KILLFOCUS 256

# Symbolic key codes and modifier flags.
# ASCII and other printable characters below 256.
# Extended keys above 300.

lappend enums(Keys) SCK_
set SCK_DOWN 300
set SCK_UP 301
set SCK_LEFT 302
set SCK_RIGHT 303
set SCK_HOME 304
set SCK_END 305
set SCK_PRIOR 306
set SCK_NEXT 307
set SCK_DELETE 308
set SCK_INSERT 309
set SCK_ESCAPE 7
set SCK_BACK 8
set SCK_TAB 9
set SCK_RETURN 13
set SCK_ADD 310
set SCK_SUBTRACT 311
set SCK_DIVIDE 312
set SCK_WIN 313
set SCK_RWIN 314
set SCK_MENU 315

lappend enums(KeyMod) SCMOD_
set SCMOD_NORM 0
set SCMOD_SHIFT 1
set SCMOD_CTRL 2
set SCMOD_ALT 4
set SCMOD_SUPER 8
set SCMOD_META 16

lappend enums(CompletionMethods) SC_AC_
set SC_AC_FILLUP 1
set SC_AC_DOUBLECLICK 2
set SC_AC_TAB 3
set SC_AC_NEWLINE 4
set SC_AC_COMMAND 5

# For SciLexer.h
lappend enums(Lexer) SCLEX_
set SCLEX_CONTAINER 0
set SCLEX_NULL 1
set SCLEX_PYTHON 2
set SCLEX_CPP 3
set SCLEX_HTML 4
set SCLEX_XML 5
set SCLEX_PERL 6
set SCLEX_SQL 7
set SCLEX_VB 8
set SCLEX_PROPERTIES 9
set SCLEX_ERRORLIST 10
set SCLEX_MAKEFILE 11
set SCLEX_BATCH 12
set SCLEX_XCODE 13
set SCLEX_LATEX 14
set SCLEX_LUA 15
set SCLEX_DIFF 16
set SCLEX_CONF 17
set SCLEX_PASCAL 18
set SCLEX_AVE 19
set SCLEX_ADA 20
set SCLEX_LISP 21
set SCLEX_RUBY 22
set SCLEX_EIFFEL 23
set SCLEX_EIFFELKW 24
set SCLEX_TCL 25
set SCLEX_NNCRONTAB 26
set SCLEX_BULLANT 27
set SCLEX_VBSCRIPT 28
set SCLEX_BAAN 31
set SCLEX_MATLAB 32
set SCLEX_SCRIPTOL 33
set SCLEX_ASM 34
set SCLEX_CPPNOCASE 35
set SCLEX_FORTRAN 36
set SCLEX_F77 37
set SCLEX_CSS 38
set SCLEX_POV 39
set SCLEX_LOUT 40
set SCLEX_ESCRIPT 41
set SCLEX_PS 42
set SCLEX_NSIS 43
set SCLEX_MMIXAL 44
set SCLEX_CLW 45
set SCLEX_CLWNOCASE 46
set SCLEX_LOT 47
set SCLEX_YAML 48
set SCLEX_TEX 49
set SCLEX_METAPOST 50
set SCLEX_POWERBASIC 51
set SCLEX_FORTH 52
set SCLEX_ERLANG 53
set SCLEX_OCTAVE 54
set SCLEX_MSSQL 55
set SCLEX_VERILOG 56
set SCLEX_KIX 57
set SCLEX_GUI4CLI 58
set SCLEX_SPECMAN 59
set SCLEX_AU3 60
set SCLEX_APDL 61
set SCLEX_BASH 62
set SCLEX_ASN1 63
set SCLEX_VHDL 64
set SCLEX_CAML 65
set SCLEX_BLITZBASIC 66
set SCLEX_PUREBASIC 67
set SCLEX_HASKELL 68
set SCLEX_PHPSCRIPT 69
set SCLEX_TADS3 70
set SCLEX_REBOL 71
set SCLEX_SMALLTALK 72
set SCLEX_FLAGSHIP 73
set SCLEX_CSOUND 74
set SCLEX_FREEBASIC 75
set SCLEX_INNOSETUP 76
set SCLEX_OPAL 77
set SCLEX_SPICE 78
set SCLEX_D 79
set SCLEX_CMAKE 80
set SCLEX_GAP 81
set SCLEX_PLM 82
set SCLEX_PROGRESS 83
set SCLEX_ABAQUS 84
set SCLEX_ASYMPTOTE 85
set SCLEX_R 86
set SCLEX_MAGIK 87
set SCLEX_POWERSHELL 88
set SCLEX_MYSQL 89
set SCLEX_PO 90
set SCLEX_TAL 91
set SCLEX_COBOL 92
set SCLEX_TACL 93
set SCLEX_SORCUS 94
set SCLEX_POWERPRO 95
set SCLEX_NIMROD 96
set SCLEX_SML 97
set SCLEX_MARKDOWN 98
set SCLEX_TXT2TAGS 99
set SCLEX_A68K 100
set SCLEX_MODULA 101
set SCLEX_COFFEESCRIPT 102
set SCLEX_TCMD 103
set SCLEX_AVS 104
set SCLEX_ECL 105
set SCLEX_OSCRIPT 106
set SCLEX_VISUALPROLOG 107
set SCLEX_LITERATEHASKELL 108
set SCLEX_STTXT 109
set SCLEX_KVIRC 110
set SCLEX_RUST 111
set SCLEX_DMAP 112
set SCLEX_AS 113
set SCLEX_DMIS 114
set SCLEX_REGISTRY 115
set SCLEX_BIBTEX 116
set SCLEX_SREC 117
set SCLEX_IHEX 118
set SCLEX_TEHEX 119

# When a lexer specifies its language as SCLEX_AUTOMATIC it receives a
# value assigned in sequence from SCLEX_AUTOMATIC+1.
set SCLEX_AUTOMATIC 1000
# Lexical states for SCLEX_PYTHON
lappend lexers(Python) SCLEX_PYTHON SCE_P_
lappend lexers(Nimrod) SCLEX_NIMROD SCE_P_
set SCE_P_DEFAULT 0
set SCE_P_COMMENTLINE 1
set SCE_P_NUMBER 2
set SCE_P_STRING 3
set SCE_P_CHARACTER 4
set SCE_P_WORD 5
set SCE_P_TRIPLE 6
set SCE_P_TRIPLEDOUBLE 7
set SCE_P_CLASSNAME 8
set SCE_P_DEFNAME 9
set SCE_P_OPERATOR 10
set SCE_P_IDENTIFIER 11
set SCE_P_COMMENTBLOCK 12
set SCE_P_STRINGEOL 13
set SCE_P_WORD2 14
set SCE_P_DECORATOR 15
# Lexical states for SCLEX_CPP, SCLEX_BULLANT, SCLEX_COBOL, SCLEX_TACL, SCLEX_TAL
lappend lexers(Cpp) SCLEX_CPP SCE_C_
lappend lexers(BullAnt) SCLEX_BULLANT SCE_C_
lappend lexers(COBOL) SCLEX_COBOL SCE_C_
lappend lexers(TACL) SCLEX_TACL SCE_C_
lappend lexers(TAL) SCLEX_TAL SCE_C_
set SCE_C_DEFAULT 0
set SCE_C_COMMENT 1
set SCE_C_COMMENTLINE 2
set SCE_C_COMMENTDOC 3
set SCE_C_NUMBER 4
set SCE_C_WORD 5
set SCE_C_STRING 6
set SCE_C_CHARACTER 7
set SCE_C_UUID 8
set SCE_C_PREPROCESSOR 9
set SCE_C_OPERATOR 10
set SCE_C_IDENTIFIER 11
set SCE_C_STRINGEOL 12
set SCE_C_VERBATIM 13
set SCE_C_REGEX 14
set SCE_C_COMMENTLINEDOC 15
set SCE_C_WORD2 16
set SCE_C_COMMENTDOCKEYWORD 17
set SCE_C_COMMENTDOCKEYWORDERROR 18
set SCE_C_GLOBALCLASS 19
set SCE_C_STRINGRAW 20
set SCE_C_TRIPLEVERBATIM 21
set SCE_C_HASHQUOTEDSTRING 22
set SCE_C_PREPROCESSORCOMMENT 23
set SCE_C_PREPROCESSORCOMMENTDOC 24
set SCE_C_USERLITERAL 25
set SCE_C_TASKMARKER 26
set SCE_C_ESCAPESEQUENCE 27
# Lexical states for SCLEX_D
lappend lexers(D) SCLEX_D SCE_D_
set SCE_D_DEFAULT 0
set SCE_D_COMMENT 1
set SCE_D_COMMENTLINE 2
set SCE_D_COMMENTDOC 3
set SCE_D_COMMENTNESTED 4
set SCE_D_NUMBER 5
set SCE_D_WORD 6
set SCE_D_WORD2 7
set SCE_D_WORD3 8
set SCE_D_TYPEDEF 9
set SCE_D_STRING 10
set SCE_D_STRINGEOL 11
set SCE_D_CHARACTER 12
set SCE_D_OPERATOR 13
set SCE_D_IDENTIFIER 14
set SCE_D_COMMENTLINEDOC 15
set SCE_D_COMMENTDOCKEYWORD 16
set SCE_D_COMMENTDOCKEYWORDERROR 17
set SCE_D_STRINGB 18
set SCE_D_STRINGR 19
set SCE_D_WORD5 20
set SCE_D_WORD6 21
set SCE_D_WORD7 22
# Lexical states for SCLEX_TCL
lappend lexers(TCL) SCLEX_TCL SCE_TCL_
set SCE_TCL_DEFAULT 0
set SCE_TCL_COMMENT 1
set SCE_TCL_COMMENTLINE 2
set SCE_TCL_NUMBER 3
set SCE_TCL_WORD_IN_QUOTE 4
set SCE_TCL_IN_QUOTE 5
set SCE_TCL_OPERATOR 6
set SCE_TCL_IDENTIFIER 7
set SCE_TCL_SUBSTITUTION 8
set SCE_TCL_SUB_BRACE 9
set SCE_TCL_MODIFIER 10
set SCE_TCL_EXPAND 11
set SCE_TCL_WORD 12
set SCE_TCL_WORD2 13
set SCE_TCL_WORD3 14
set SCE_TCL_WORD4 15
set SCE_TCL_WORD5 16
set SCE_TCL_WORD6 17
set SCE_TCL_WORD7 18
set SCE_TCL_WORD8 19
set SCE_TCL_COMMENT_BOX 20
set SCE_TCL_BLOCK_COMMENT 21
# Lexical states for SCLEX_HTML, SCLEX_XML
lappend lexers(HTML) SCLEX_HTML SCE_H_ SCE_HJ_ SCE_HJA_ SCE_HB_ SCE_HBA_ SCE_HP_ SCE_HPHP_ SCE_HPA_
lappend lexers(XML) SCLEX_XML SCE_H_ SCE_HJ_ SCE_HJA_ SCE_HB_ SCE_HBA_ SCE_HP_ SCE_HPHP_ SCE_HPA_
set SCE_H_DEFAULT 0
set SCE_H_TAG 1
set SCE_H_TAGUNKNOWN 2
set SCE_H_ATTRIBUTE 3
set SCE_H_ATTRIBUTEUNKNOWN 4
set SCE_H_NUMBER 5
set SCE_H_DOUBLESTRING 6
set SCE_H_SINGLESTRING 7
set SCE_H_OTHER 8
set SCE_H_COMMENT 9
set SCE_H_ENTITY 10
# XML and ASP
set SCE_H_TAGEND 11
set SCE_H_XMLSTART 12
set SCE_H_XMLEND 13
set SCE_H_SCRIPT 14
set SCE_H_ASP 15
set SCE_H_ASPAT 16
set SCE_H_CDATA 17
set SCE_H_QUESTION 18
# More HTML
set SCE_H_VALUE 19
# X-Code
set SCE_H_XCCOMMENT 20
# SGML
set SCE_H_SGML_DEFAULT 21
set SCE_H_SGML_COMMAND 22
set SCE_H_SGML_1ST_PARAM 23
set SCE_H_SGML_DOUBLESTRING 24
set SCE_H_SGML_SIMPLESTRING 25
set SCE_H_SGML_ERROR 26
set SCE_H_SGML_SPECIAL 27
set SCE_H_SGML_ENTITY 28
set SCE_H_SGML_COMMENT 29
set SCE_H_SGML_1ST_PARAM_COMMENT 30
set SCE_H_SGML_BLOCK_DEFAULT 31
# Embedded Javascript
set SCE_HJ_START 40
set SCE_HJ_DEFAULT 41
set SCE_HJ_COMMENT 42
set SCE_HJ_COMMENTLINE 43
set SCE_HJ_COMMENTDOC 44
set SCE_HJ_NUMBER 45
set SCE_HJ_WORD 46
set SCE_HJ_KEYWORD 47
set SCE_HJ_DOUBLESTRING 48
set SCE_HJ_SINGLESTRING 49
set SCE_HJ_SYMBOLS 50
set SCE_HJ_STRINGEOL 51
set SCE_HJ_REGEX 52
# ASP Javascript
set SCE_HJA_START 55
set SCE_HJA_DEFAULT 56
set SCE_HJA_COMMENT 57
set SCE_HJA_COMMENTLINE 58
set SCE_HJA_COMMENTDOC 59
set SCE_HJA_NUMBER 60
set SCE_HJA_WORD 61
set SCE_HJA_KEYWORD 62
set SCE_HJA_DOUBLESTRING 63
set SCE_HJA_SINGLESTRING 64
set SCE_HJA_SYMBOLS 65
set SCE_HJA_STRINGEOL 66
set SCE_HJA_REGEX 67
# Embedded VBScript
set SCE_HB_START 70
set SCE_HB_DEFAULT 71
set SCE_HB_COMMENTLINE 72
set SCE_HB_NUMBER 73
set SCE_HB_WORD 74
set SCE_HB_STRING 75
set SCE_HB_IDENTIFIER 76
set SCE_HB_STRINGEOL 77
# ASP VBScript
set SCE_HBA_START 80
set SCE_HBA_DEFAULT 81
set SCE_HBA_COMMENTLINE 82
set SCE_HBA_NUMBER 83
set SCE_HBA_WORD 84
set SCE_HBA_STRING 85
set SCE_HBA_IDENTIFIER 86
set SCE_HBA_STRINGEOL 87
# Embedded Python
set SCE_HP_START 90
set SCE_HP_DEFAULT 91
set SCE_HP_COMMENTLINE 92
set SCE_HP_NUMBER 93
set SCE_HP_STRING 94
set SCE_HP_CHARACTER 95
set SCE_HP_WORD 96
set SCE_HP_TRIPLE 97
set SCE_HP_TRIPLEDOUBLE 98
set SCE_HP_CLASSNAME 99
set SCE_HP_DEFNAME 100
set SCE_HP_OPERATOR 101
set SCE_HP_IDENTIFIER 102
# PHP
set SCE_HPHP_COMPLEX_VARIABLE 104
# ASP Python
set SCE_HPA_START 105
set SCE_HPA_DEFAULT 106
set SCE_HPA_COMMENTLINE 107
set SCE_HPA_NUMBER 108
set SCE_HPA_STRING 109
set SCE_HPA_CHARACTER 110
set SCE_HPA_WORD 111
set SCE_HPA_TRIPLE 112
set SCE_HPA_TRIPLEDOUBLE 113
set SCE_HPA_CLASSNAME 114
set SCE_HPA_DEFNAME 115
set SCE_HPA_OPERATOR 116
set SCE_HPA_IDENTIFIER 117
# PHP
set SCE_HPHP_DEFAULT 118
set SCE_HPHP_HSTRING 119
set SCE_HPHP_SIMPLESTRING 120
set SCE_HPHP_WORD 121
set SCE_HPHP_NUMBER 122
set SCE_HPHP_VARIABLE 123
set SCE_HPHP_COMMENT 124
set SCE_HPHP_COMMENTLINE 125
set SCE_HPHP_HSTRING_VARIABLE 126
set SCE_HPHP_OPERATOR 127
# Lexical states for SCLEX_PERL
lappend lexers(Perl) SCLEX_PERL SCE_PL_
set SCE_PL_DEFAULT 0
set SCE_PL_ERROR 1
set SCE_PL_COMMENTLINE 2
set SCE_PL_POD 3
set SCE_PL_NUMBER 4
set SCE_PL_WORD 5
set SCE_PL_STRING 6
set SCE_PL_CHARACTER 7
set SCE_PL_PUNCTUATION 8
set SCE_PL_PREPROCESSOR 9
set SCE_PL_OPERATOR 10
set SCE_PL_IDENTIFIER 11
set SCE_PL_SCALAR 12
set SCE_PL_ARRAY 13
set SCE_PL_HASH 14
set SCE_PL_SYMBOLTABLE 15
set SCE_PL_VARIABLE_INDEXER 16
set SCE_PL_REGEX 17
set SCE_PL_REGSUBST 18
set SCE_PL_LONGQUOTE 19
set SCE_PL_BACKTICKS 20
set SCE_PL_DATASECTION 21
set SCE_PL_HERE_DELIM 22
set SCE_PL_HERE_Q 23
set SCE_PL_HERE_QQ 24
set SCE_PL_HERE_QX 25
set SCE_PL_STRING_Q 26
set SCE_PL_STRING_QQ 27
set SCE_PL_STRING_QX 28
set SCE_PL_STRING_QR 29
set SCE_PL_STRING_QW 30
set SCE_PL_POD_VERB 31
set SCE_PL_SUB_PROTOTYPE 40
set SCE_PL_FORMAT_IDENT 41
set SCE_PL_FORMAT 42
set SCE_PL_STRING_VAR 43
set SCE_PL_XLAT 44
set SCE_PL_REGEX_VAR 54
set SCE_PL_REGSUBST_VAR 55
set SCE_PL_BACKTICKS_VAR 57
set SCE_PL_HERE_QQ_VAR 61
set SCE_PL_HERE_QX_VAR 62
set SCE_PL_STRING_QQ_VAR 64
set SCE_PL_STRING_QX_VAR 65
set SCE_PL_STRING_QR_VAR 66
# Lexical states for SCLEX_RUBY
lappend lexers(Ruby) SCLEX_RUBY SCE_RB_
set SCE_RB_DEFAULT 0
set SCE_RB_ERROR 1
set SCE_RB_COMMENTLINE 2
set SCE_RB_POD 3
set SCE_RB_NUMBER 4
set SCE_RB_WORD 5
set SCE_RB_STRING 6
set SCE_RB_CHARACTER 7
set SCE_RB_CLASSNAME 8
set SCE_RB_DEFNAME 9
set SCE_RB_OPERATOR 10
set SCE_RB_IDENTIFIER 11
set SCE_RB_REGEX 12
set SCE_RB_GLOBAL 13
set SCE_RB_SYMBOL 14
set SCE_RB_MODULE_NAME 15
set SCE_RB_INSTANCE_VAR 16
set SCE_RB_CLASS_VAR 17
set SCE_RB_BACKTICKS 18
set SCE_RB_DATASECTION 19
set SCE_RB_HERE_DELIM 20
set SCE_RB_HERE_Q 21
set SCE_RB_HERE_QQ 22
set SCE_RB_HERE_QX 23
set SCE_RB_STRING_Q 24
set SCE_RB_STRING_QQ 25
set SCE_RB_STRING_QX 26
set SCE_RB_STRING_QR 27
set SCE_RB_STRING_QW 28
set SCE_RB_WORD_DEMOTED 29
set SCE_RB_STDIN 30
set SCE_RB_STDOUT 31
set SCE_RB_STDERR 40
set SCE_RB_UPPER_BOUND 41
# Lexical states for SCLEX_VB, SCLEX_VBSCRIPT, SCLEX_POWERBASIC, SCLEX_BLITZBASIC, SCLEX_PUREBASIC, SCLEX_FREEBASIC
lappend lexers(VB) SCLEX_VB SCE_B_
lappend lexers(VBScript) SCLEX_VBSCRIPT SCE_B_
lappend lexers(PowerBasic) SCLEX_POWERBASIC SCE_B_
lappend lexers(BlitzBasic) SCLEX_BLITZBASIC SCE_B_
lappend lexers(PureBasic) SCLEX_PUREBASIC SCE_B_
lappend lexers(FreeBasic) SCLEX_FREEBASIC SCE_B_
set SCE_B_DEFAULT 0
set SCE_B_COMMENT 1
set SCE_B_NUMBER 2
set SCE_B_KEYWORD 3
set SCE_B_STRING 4
set SCE_B_PREPROCESSOR 5
set SCE_B_OPERATOR 6
set SCE_B_IDENTIFIER 7
set SCE_B_DATE 8
set SCE_B_STRINGEOL 9
set SCE_B_KEYWORD2 10
set SCE_B_KEYWORD3 11
set SCE_B_KEYWORD4 12
set SCE_B_CONSTANT 13
set SCE_B_ASM 14
set SCE_B_LABEL 15
set SCE_B_ERROR 16
set SCE_B_HEXNUMBER 17
set SCE_B_BINNUMBER 18
set SCE_B_COMMENTBLOCK 19
set SCE_B_DOCLINE 20
set SCE_B_DOCBLOCK 21
set SCE_B_DOCKEYWORD 22
# Lexical states for SCLEX_PROPERTIES
lappend lexers(Properties) SCLEX_PROPERTIES SCE_PROPS_
set SCE_PROPS_DEFAULT 0
set SCE_PROPS_COMMENT 1
set SCE_PROPS_SECTION 2
set SCE_PROPS_ASSIGNMENT 3
set SCE_PROPS_DEFVAL 4
set SCE_PROPS_KEY 5
# Lexical states for SCLEX_LATEX
lappend lexers(LaTeX) SCLEX_LATEX SCE_L_
set SCE_L_DEFAULT 0
set SCE_L_COMMAND 1
set SCE_L_TAG 2
set SCE_L_MATH 3
set SCE_L_COMMENT 4
set SCE_L_TAG2 5
set SCE_L_MATH2 6
set SCE_L_COMMENT2 7
set SCE_L_VERBATIM 8
set SCE_L_SHORTCMD 9
set SCE_L_SPECIAL 10
set SCE_L_CMDOPT 11
set SCE_L_ERROR 12
# Lexical states for SCLEX_LUA
lappend lexers(Lua) SCLEX_LUA SCE_LUA_
set SCE_LUA_DEFAULT 0
set SCE_LUA_COMMENT 1
set SCE_LUA_COMMENTLINE 2
set SCE_LUA_COMMENTDOC 3
set SCE_LUA_NUMBER 4
set SCE_LUA_WORD 5
set SCE_LUA_STRING 6
set SCE_LUA_CHARACTER 7
set SCE_LUA_LITERALSTRING 8
set SCE_LUA_PREPROCESSOR 9
set SCE_LUA_OPERATOR 10
set SCE_LUA_IDENTIFIER 11
set SCE_LUA_STRINGEOL 12
set SCE_LUA_WORD2 13
set SCE_LUA_WORD3 14
set SCE_LUA_WORD4 15
set SCE_LUA_WORD5 16
set SCE_LUA_WORD6 17
set SCE_LUA_WORD7 18
set SCE_LUA_WORD8 19
set SCE_LUA_LABEL 20
# Lexical states for SCLEX_ERRORLIST
lappend lexers(ErrorList) SCLEX_ERRORLIST SCE_ERR_
set SCE_ERR_DEFAULT 0
set SCE_ERR_PYTHON 1
set SCE_ERR_GCC 2
set SCE_ERR_MS 3
set SCE_ERR_CMD 4
set SCE_ERR_BORLAND 5
set SCE_ERR_PERL 6
set SCE_ERR_NET 7
set SCE_ERR_LUA 8
set SCE_ERR_CTAG 9
set SCE_ERR_DIFF_CHANGED 10
set SCE_ERR_DIFF_ADDITION 11
set SCE_ERR_DIFF_DELETION 12
set SCE_ERR_DIFF_MESSAGE 13
set SCE_ERR_PHP 14
set SCE_ERR_ELF 15
set SCE_ERR_IFC 16
set SCE_ERR_IFORT 17
set SCE_ERR_ABSF 18
set SCE_ERR_TIDY 19
set SCE_ERR_JAVA_STACK 20
set SCE_ERR_VALUE 21
set SCE_ERR_GCC_INCLUDED_FROM 22
set SCE_ERR_ESCSEQ 23
set SCE_ERR_ESCSEQ_UNKNOWN 24
set SCE_ERR_ES_BLACK 40
set SCE_ERR_ES_RED 41
set SCE_ERR_ES_GREEN 42
set SCE_ERR_ES_BROWN 43
set SCE_ERR_ES_BLUE 44
set SCE_ERR_ES_MAGENTA 45
set SCE_ERR_ES_CYAN 46
set SCE_ERR_ES_GRAY 47
set SCE_ERR_ES_DARK_GRAY 48
set SCE_ERR_ES_BRIGHT_RED 49
set SCE_ERR_ES_BRIGHT_GREEN 50
set SCE_ERR_ES_YELLOW 51
set SCE_ERR_ES_BRIGHT_BLUE 52
set SCE_ERR_ES_BRIGHT_MAGENTA 53
set SCE_ERR_ES_BRIGHT_CYAN 54
set SCE_ERR_ES_WHITE 55
# Lexical states for SCLEX_BATCH
lappend lexers(Batch) SCLEX_BATCH SCE_BAT_
set SCE_BAT_DEFAULT 0
set SCE_BAT_COMMENT 1
set SCE_BAT_WORD 2
set SCE_BAT_LABEL 3
set SCE_BAT_HIDE 4
set SCE_BAT_COMMAND 5
set SCE_BAT_IDENTIFIER 6
set SCE_BAT_OPERATOR 7
# Lexical states for SCLEX_TCMD
lappend lexers(TCMD) SCLEX_TCMD SCE_TCMD_
set SCE_TCMD_DEFAULT 0
set SCE_TCMD_COMMENT 1
set SCE_TCMD_WORD 2
set SCE_TCMD_LABEL 3
set SCE_TCMD_HIDE 4
set SCE_TCMD_COMMAND 5
set SCE_TCMD_IDENTIFIER 6
set SCE_TCMD_OPERATOR 7
set SCE_TCMD_ENVIRONMENT 8
set SCE_TCMD_EXPANSION 9
set SCE_TCMD_CLABEL 10
# Lexical states for SCLEX_MAKEFILE
lappend lexers(MakeFile) SCLEX_MAKEFILE SCE_MAKE_
set SCE_MAKE_DEFAULT 0
set SCE_MAKE_COMMENT 1
set SCE_MAKE_PREPROCESSOR 2
set SCE_MAKE_IDENTIFIER 3
set SCE_MAKE_OPERATOR 4
set SCE_MAKE_TARGET 5
set SCE_MAKE_IDEOL 9
# Lexical states for SCLEX_DIFF
lappend lexers(Diff) SCLEX_DIFF SCE_DIFF_
set SCE_DIFF_DEFAULT 0
set SCE_DIFF_COMMENT 1
set SCE_DIFF_COMMAND 2
set SCE_DIFF_HEADER 3
set SCE_DIFF_POSITION 4
set SCE_DIFF_DELETED 5
set SCE_DIFF_ADDED 6
set SCE_DIFF_CHANGED 7
# Lexical states for SCLEX_CONF (Apache Configuration Files Lexer)
lappend lexers(Conf) SCLEX_CONF SCE_CONF_
set SCE_CONF_DEFAULT 0
set SCE_CONF_COMMENT 1
set SCE_CONF_NUMBER 2
set SCE_CONF_IDENTIFIER 3
set SCE_CONF_EXTENSION 4
set SCE_CONF_PARAMETER 5
set SCE_CONF_STRING 6
set SCE_CONF_OPERATOR 7
set SCE_CONF_IP 8
set SCE_CONF_DIRECTIVE 9
# Lexical states for SCLEX_AVE, Avenue
lappend lexers(Avenue) SCLEX_AVE SCE_AVE_
set SCE_AVE_DEFAULT 0
set SCE_AVE_COMMENT 1
set SCE_AVE_NUMBER 2
set SCE_AVE_WORD 3
set SCE_AVE_STRING 6
set SCE_AVE_ENUM 7
set SCE_AVE_STRINGEOL 8
set SCE_AVE_IDENTIFIER 9
set SCE_AVE_OPERATOR 10
set SCE_AVE_WORD1 11
set SCE_AVE_WORD2 12
set SCE_AVE_WORD3 13
set SCE_AVE_WORD4 14
set SCE_AVE_WORD5 15
set SCE_AVE_WORD6 16
# Lexical states for SCLEX_ADA
lappend lexers(Ada) SCLEX_ADA SCE_ADA_
set SCE_ADA_DEFAULT 0
set SCE_ADA_WORD 1
set SCE_ADA_IDENTIFIER 2
set SCE_ADA_NUMBER 3
set SCE_ADA_DELIMITER 4
set SCE_ADA_CHARACTER 5
set SCE_ADA_CHARACTEREOL 6
set SCE_ADA_STRING 7
set SCE_ADA_STRINGEOL 8
set SCE_ADA_LABEL 9
set SCE_ADA_COMMENTLINE 10
set SCE_ADA_ILLEGAL 11
# Lexical states for SCLEX_BAAN
lappend lexers(Baan) SCLEX_BAAN SCE_BAAN_
set SCE_BAAN_DEFAULT 0
set SCE_BAAN_COMMENT 1
set SCE_BAAN_COMMENTDOC 2
set SCE_BAAN_NUMBER 3
set SCE_BAAN_WORD 4
set SCE_BAAN_STRING 5
set SCE_BAAN_PREPROCESSOR 6
set SCE_BAAN_OPERATOR 7
set SCE_BAAN_IDENTIFIER 8
set SCE_BAAN_STRINGEOL 9
set SCE_BAAN_WORD2 10
# Lexical states for SCLEX_LISP
lappend lexers(Lisp) SCLEX_LISP SCE_LISP_
set SCE_LISP_DEFAULT 0
set SCE_LISP_COMMENT 1
set SCE_LISP_NUMBER 2
set SCE_LISP_KEYWORD 3
set SCE_LISP_KEYWORD_KW 4
set SCE_LISP_SYMBOL 5
set SCE_LISP_STRING 6
set SCE_LISP_STRINGEOL 8
set SCE_LISP_IDENTIFIER 9
set SCE_LISP_OPERATOR 10
set SCE_LISP_SPECIAL 11
set SCE_LISP_MULTI_COMMENT 12
# Lexical states for SCLEX_EIFFEL and SCLEX_EIFFELKW
lappend lexers(Eiffel) SCLEX_EIFFEL SCE_EIFFEL_
lappend lexers(EiffelKW) SCLEX_EIFFELKW SCE_EIFFEL_
set SCE_EIFFEL_DEFAULT 0
set SCE_EIFFEL_COMMENTLINE 1
set SCE_EIFFEL_NUMBER 2
set SCE_EIFFEL_WORD 3
set SCE_EIFFEL_STRING 4
set SCE_EIFFEL_CHARACTER 5
set SCE_EIFFEL_OPERATOR 6
set SCE_EIFFEL_IDENTIFIER 7
set SCE_EIFFEL_STRINGEOL 8
# Lexical states for SCLEX_NNCRONTAB (nnCron crontab Lexer)
lappend lexers(NNCronTab) SCLEX_NNCRONTAB SCE_NNCRONTAB_
set SCE_NNCRONTAB_DEFAULT 0
set SCE_NNCRONTAB_COMMENT 1
set SCE_NNCRONTAB_TASK 2
set SCE_NNCRONTAB_SECTION 3
set SCE_NNCRONTAB_KEYWORD 4
set SCE_NNCRONTAB_MODIFIER 5
set SCE_NNCRONTAB_ASTERISK 6
set SCE_NNCRONTAB_NUMBER 7
set SCE_NNCRONTAB_STRING 8
set SCE_NNCRONTAB_ENVIRONMENT 9
set SCE_NNCRONTAB_IDENTIFIER 10
# Lexical states for SCLEX_FORTH (Forth Lexer)
lappend lexers(Forth) SCLEX_FORTH SCE_FORTH_
set SCE_FORTH_DEFAULT 0
set SCE_FORTH_COMMENT 1
set SCE_FORTH_COMMENT_ML 2
set SCE_FORTH_IDENTIFIER 3
set SCE_FORTH_CONTROL 4
set SCE_FORTH_KEYWORD 5
set SCE_FORTH_DEFWORD 6
set SCE_FORTH_PREWORD1 7
set SCE_FORTH_PREWORD2 8
set SCE_FORTH_NUMBER 9
set SCE_FORTH_STRING 10
set SCE_FORTH_LOCALE 11
# Lexical states for SCLEX_MATLAB
lappend lexers(MatLab) SCLEX_MATLAB SCE_MATLAB_
set SCE_MATLAB_DEFAULT 0
set SCE_MATLAB_COMMENT 1
set SCE_MATLAB_COMMAND 2
set SCE_MATLAB_NUMBER 3
set SCE_MATLAB_KEYWORD 4
# single quoted string
set SCE_MATLAB_STRING 5
set SCE_MATLAB_OPERATOR 6
set SCE_MATLAB_IDENTIFIER 7
set SCE_MATLAB_DOUBLEQUOTESTRING 8
# Lexical states for SCLEX_SCRIPTOL
lappend lexers(Sol) SCLEX_SCRIPTOL SCE_SCRIPTOL_
set SCE_SCRIPTOL_DEFAULT 0
set SCE_SCRIPTOL_WHITE 1
set SCE_SCRIPTOL_COMMENTLINE 2
set SCE_SCRIPTOL_PERSISTENT 3
set SCE_SCRIPTOL_CSTYLE 4
set SCE_SCRIPTOL_COMMENTBLOCK 5
set SCE_SCRIPTOL_NUMBER 6
set SCE_SCRIPTOL_STRING 7
set SCE_SCRIPTOL_CHARACTER 8
set SCE_SCRIPTOL_STRINGEOL 9
set SCE_SCRIPTOL_KEYWORD 10
set SCE_SCRIPTOL_OPERATOR 11
set SCE_SCRIPTOL_IDENTIFIER 12
set SCE_SCRIPTOL_TRIPLE 13
set SCE_SCRIPTOL_CLASSNAME 14
set SCE_SCRIPTOL_PREPROCESSOR 15
# Lexical states for SCLEX_ASM, SCLEX_AS
lappend lexers(Asm) SCLEX_ASM SCE_ASM_
lappend lexers(As) SCLEX_AS SCE_ASM_
set SCE_ASM_DEFAULT 0
set SCE_ASM_COMMENT 1
set SCE_ASM_NUMBER 2
set SCE_ASM_STRING 3
set SCE_ASM_OPERATOR 4
set SCE_ASM_IDENTIFIER 5
set SCE_ASM_CPUINSTRUCTION 6
set SCE_ASM_MATHINSTRUCTION 7
set SCE_ASM_REGISTER 8
set SCE_ASM_DIRECTIVE 9
set SCE_ASM_DIRECTIVEOPERAND 10
set SCE_ASM_COMMENTBLOCK 11
set SCE_ASM_CHARACTER 12
set SCE_ASM_STRINGEOL 13
set SCE_ASM_EXTINSTRUCTION 14
set SCE_ASM_COMMENTDIRECTIVE 15
# Lexical states for SCLEX_FORTRAN
lappend lexers(Fortran) SCLEX_FORTRAN SCE_F_
lappend lexers(F77) SCLEX_F77 SCE_F_
set SCE_F_DEFAULT 0
set SCE_F_COMMENT 1
set SCE_F_NUMBER 2
set SCE_F_STRING1 3
set SCE_F_STRING2 4
set SCE_F_STRINGEOL 5
set SCE_F_OPERATOR 6
set SCE_F_IDENTIFIER 7
set SCE_F_WORD 8
set SCE_F_WORD2 9
set SCE_F_WORD3 10
set SCE_F_PREPROCESSOR 11
set SCE_F_OPERATOR2 12
set SCE_F_LABEL 13
set SCE_F_CONTINUATION 14
# Lexical states for SCLEX_CSS
lappend lexers(CSS) SCLEX_CSS SCE_CSS_
set SCE_CSS_DEFAULT 0
set SCE_CSS_TAG 1
set SCE_CSS_CLASS 2
set SCE_CSS_PSEUDOCLASS 3
set SCE_CSS_UNKNOWN_PSEUDOCLASS 4
set SCE_CSS_OPERATOR 5
set SCE_CSS_IDENTIFIER 6
set SCE_CSS_UNKNOWN_IDENTIFIER 7
set SCE_CSS_VALUE 8
set SCE_CSS_COMMENT 9
set SCE_CSS_ID 10
set SCE_CSS_IMPORTANT 11
set SCE_CSS_DIRECTIVE 12
set SCE_CSS_DOUBLESTRING 13
set SCE_CSS_SINGLESTRING 14
set SCE_CSS_IDENTIFIER2 15
set SCE_CSS_ATTRIBUTE 16
set SCE_CSS_IDENTIFIER3 17
set SCE_CSS_PSEUDOELEMENT 18
set SCE_CSS_EXTENDED_IDENTIFIER 19
set SCE_CSS_EXTENDED_PSEUDOCLASS 20
set SCE_CSS_EXTENDED_PSEUDOELEMENT 21
set SCE_CSS_MEDIA 22
set SCE_CSS_VARIABLE 23
# Lexical states for SCLEX_POV
lappend lexers(POV) SCLEX_POV SCE_POV_
set SCE_POV_DEFAULT 0
set SCE_POV_COMMENT 1
set SCE_POV_COMMENTLINE 2
set SCE_POV_NUMBER 3
set SCE_POV_OPERATOR 4
set SCE_POV_IDENTIFIER 5
set SCE_POV_STRING 6
set SCE_POV_STRINGEOL 7
set SCE_POV_DIRECTIVE 8
set SCE_POV_BADDIRECTIVE 9
set SCE_POV_WORD2 10
set SCE_POV_WORD3 11
set SCE_POV_WORD4 12
set SCE_POV_WORD5 13
set SCE_POV_WORD6 14
set SCE_POV_WORD7 15
set SCE_POV_WORD8 16
# Lexical states for SCLEX_LOUT
lappend lexers(LOUT) SCLEX_LOUT SCE_LOUT_
set SCE_LOUT_DEFAULT 0
set SCE_LOUT_COMMENT 1
set SCE_LOUT_NUMBER 2
set SCE_LOUT_WORD 3
set SCE_LOUT_WORD2 4
set SCE_LOUT_WORD3 5
set SCE_LOUT_WORD4 6
set SCE_LOUT_STRING 7
set SCE_LOUT_OPERATOR 8
set SCE_LOUT_IDENTIFIER 9
set SCE_LOUT_STRINGEOL 10
# Lexical states for SCLEX_ESCRIPT
lappend lexers(ESCRIPT) SCLEX_ESCRIPT SCE_ESCRIPT_
set SCE_ESCRIPT_DEFAULT 0
set SCE_ESCRIPT_COMMENT 1
set SCE_ESCRIPT_COMMENTLINE 2
set SCE_ESCRIPT_COMMENTDOC 3
set SCE_ESCRIPT_NUMBER 4
set SCE_ESCRIPT_WORD 5
set SCE_ESCRIPT_STRING 6
set SCE_ESCRIPT_OPERATOR 7
set SCE_ESCRIPT_IDENTIFIER 8
set SCE_ESCRIPT_BRACE 9
set SCE_ESCRIPT_WORD2 10
set SCE_ESCRIPT_WORD3 11
# Lexical states for SCLEX_PS
lappend lexers(PS) SCLEX_PS SCE_PS_
set SCE_PS_DEFAULT 0
set SCE_PS_COMMENT 1
set SCE_PS_DSC_COMMENT 2
set SCE_PS_DSC_VALUE 3
set SCE_PS_NUMBER 4
set SCE_PS_NAME 5
set SCE_PS_KEYWORD 6
set SCE_PS_LITERAL 7
set SCE_PS_IMMEVAL 8
set SCE_PS_PAREN_ARRAY 9
set SCE_PS_PAREN_DICT 10
set SCE_PS_PAREN_PROC 11
set SCE_PS_TEXT 12
set SCE_PS_HEXSTRING 13
set SCE_PS_BASE85STRING 14
set SCE_PS_BADSTRINGCHAR 15
# Lexical states for SCLEX_NSIS
lappend lexers(NSIS) SCLEX_NSIS SCE_NSIS_
set SCE_NSIS_DEFAULT 0
set SCE_NSIS_COMMENT 1
set SCE_NSIS_STRINGDQ 2
set SCE_NSIS_STRINGLQ 3
set SCE_NSIS_STRINGRQ 4
set SCE_NSIS_FUNCTION 5
set SCE_NSIS_VARIABLE 6
set SCE_NSIS_LABEL 7
set SCE_NSIS_USERDEFINED 8
set SCE_NSIS_SECTIONDEF 9
set SCE_NSIS_SUBSECTIONDEF 10
set SCE_NSIS_IFDEFINEDEF 11
set SCE_NSIS_MACRODEF 12
set SCE_NSIS_STRINGVAR 13
set SCE_NSIS_NUMBER 14
set SCE_NSIS_SECTIONGROUP 15
set SCE_NSIS_PAGEEX 16
set SCE_NSIS_FUNCTIONDEF 17
set SCE_NSIS_COMMENTBOX 18
# Lexical states for SCLEX_MMIXAL
lappend lexers(MMIXAL) SCLEX_MMIXAL SCE_MMIXAL_
set SCE_MMIXAL_LEADWS 0
set SCE_MMIXAL_COMMENT 1
set SCE_MMIXAL_LABEL 2
set SCE_MMIXAL_OPCODE 3
set SCE_MMIXAL_OPCODE_PRE 4
set SCE_MMIXAL_OPCODE_VALID 5
set SCE_MMIXAL_OPCODE_UNKNOWN 6
set SCE_MMIXAL_OPCODE_POST 7
set SCE_MMIXAL_OPERANDS 8
set SCE_MMIXAL_NUMBER 9
set SCE_MMIXAL_REF 10
set SCE_MMIXAL_CHAR 11
set SCE_MMIXAL_STRING 12
set SCE_MMIXAL_REGISTER 13
set SCE_MMIXAL_HEX 14
set SCE_MMIXAL_OPERATOR 15
set SCE_MMIXAL_SYMBOL 16
set SCE_MMIXAL_INCLUDE 17
# Lexical states for SCLEX_CLW
lappend lexers(Clarion) SCLEX_CLW SCE_CLW_
set SCE_CLW_DEFAULT 0
set SCE_CLW_LABEL 1
set SCE_CLW_COMMENT 2
set SCE_CLW_STRING 3
set SCE_CLW_USER_IDENTIFIER 4
set SCE_CLW_INTEGER_CONSTANT 5
set SCE_CLW_REAL_CONSTANT 6
set SCE_CLW_PICTURE_STRING 7
set SCE_CLW_KEYWORD 8
set SCE_CLW_COMPILER_DIRECTIVE 9
set SCE_CLW_RUNTIME_EXPRESSIONS 10
set SCE_CLW_BUILTIN_PROCEDURES_FUNCTION 11
set SCE_CLW_STRUCTURE_DATA_TYPE 12
set SCE_CLW_ATTRIBUTE 13
set SCE_CLW_STANDARD_EQUATE 14
set SCE_CLW_ERROR 15
set SCE_CLW_DEPRECATED 16
# Lexical states for SCLEX_LOT
lappend lexers(LOT) SCLEX_LOT SCE_LOT_
set SCE_LOT_DEFAULT 0
set SCE_LOT_HEADER 1
set SCE_LOT_BREAK 2
set SCE_LOT_SET 3
set SCE_LOT_PASS 4
set SCE_LOT_FAIL 5
set SCE_LOT_ABORT 6
# Lexical states for SCLEX_YAML
lappend lexers(YAML) SCLEX_YAML SCE_YAML_
set SCE_YAML_DEFAULT 0
set SCE_YAML_COMMENT 1
set SCE_YAML_IDENTIFIER 2
set SCE_YAML_KEYWORD 3
set SCE_YAML_NUMBER 4
set SCE_YAML_REFERENCE 5
set SCE_YAML_DOCUMENT 6
set SCE_YAML_TEXT 7
set SCE_YAML_ERROR 8
set SCE_YAML_OPERATOR 9
# Lexical states for SCLEX_TEX
lappend lexers(TeX) SCLEX_TEX SCE_TEX_
set SCE_TEX_DEFAULT 0
set SCE_TEX_SPECIAL 1
set SCE_TEX_GROUP 2
set SCE_TEX_SYMBOL 3
set SCE_TEX_COMMAND 4
set SCE_TEX_TEXT 5
lappend lexers(Metapost) SCLEX_METAPOST SCE_METAPOST_
set SCE_METAPOST_DEFAULT 0
set SCE_METAPOST_SPECIAL 1
set SCE_METAPOST_GROUP 2
set SCE_METAPOST_SYMBOL 3
set SCE_METAPOST_COMMAND 4
set SCE_METAPOST_TEXT 5
set SCE_METAPOST_EXTRA 6
# Lexical states for SCLEX_ERLANG
lappend lexers(Erlang) SCLEX_ERLANG SCE_ERLANG_
set SCE_ERLANG_DEFAULT 0
set SCE_ERLANG_COMMENT 1
set SCE_ERLANG_VARIABLE 2
set SCE_ERLANG_NUMBER 3
set SCE_ERLANG_KEYWORD 4
set SCE_ERLANG_STRING 5
set SCE_ERLANG_OPERATOR 6
set SCE_ERLANG_ATOM 7
set SCE_ERLANG_FUNCTION_NAME 8
set SCE_ERLANG_CHARACTER 9
set SCE_ERLANG_MACRO 10
set SCE_ERLANG_RECORD 11
set SCE_ERLANG_PREPROC 12
set SCE_ERLANG_NODE_NAME 13
set SCE_ERLANG_COMMENT_FUNCTION 14
set SCE_ERLANG_COMMENT_MODULE 15
set SCE_ERLANG_COMMENT_DOC 16
set SCE_ERLANG_COMMENT_DOC_MACRO 17
set SCE_ERLANG_ATOM_QUOTED 18
set SCE_ERLANG_MACRO_QUOTED 19
set SCE_ERLANG_RECORD_QUOTED 20
set SCE_ERLANG_NODE_NAME_QUOTED 21
set SCE_ERLANG_BIFS 22
set SCE_ERLANG_MODULES 23
set SCE_ERLANG_MODULES_ATT 24
set SCE_ERLANG_UNKNOWN 31
# Lexical states for SCLEX_OCTAVE are identical to MatLab
lappend lexers(Octave) SCLEX_OCTAVE SCE_MATLAB_
# Lexical states for SCLEX_MSSQL
lappend lexers(MSSQL) SCLEX_MSSQL SCE_MSSQL_
set SCE_MSSQL_DEFAULT 0
set SCE_MSSQL_COMMENT 1
set SCE_MSSQL_LINE_COMMENT 2
set SCE_MSSQL_NUMBER 3
set SCE_MSSQL_STRING 4
set SCE_MSSQL_OPERATOR 5
set SCE_MSSQL_IDENTIFIER 6
set SCE_MSSQL_VARIABLE 7
set SCE_MSSQL_COLUMN_NAME 8
set SCE_MSSQL_STATEMENT 9
set SCE_MSSQL_DATATYPE 10
set SCE_MSSQL_SYSTABLE 11
set SCE_MSSQL_GLOBAL_VARIABLE 12
set SCE_MSSQL_FUNCTION 13
set SCE_MSSQL_STORED_PROCEDURE 14
set SCE_MSSQL_DEFAULT_PREF_DATATYPE 15
set SCE_MSSQL_COLUMN_NAME_2 16
# Lexical states for SCLEX_VERILOG
lappend lexers(Verilog) SCLEX_VERILOG SCE_V_
set SCE_V_DEFAULT 0
set SCE_V_COMMENT 1
set SCE_V_COMMENTLINE 2
set SCE_V_COMMENTLINEBANG 3
set SCE_V_NUMBER 4
set SCE_V_WORD 5
set SCE_V_STRING 6
set SCE_V_WORD2 7
set SCE_V_WORD3 8
set SCE_V_PREPROCESSOR 9
set SCE_V_OPERATOR 10
set SCE_V_IDENTIFIER 11
set SCE_V_STRINGEOL 12
set SCE_V_USER 19
set SCE_V_COMMENT_WORD 20
set SCE_V_INPUT 21
set SCE_V_OUTPUT 22
set SCE_V_INOUT 23
set SCE_V_PORT_CONNECT 24
# Operations supported by privatLexerCall for Verilog
set SCE_V_PCALL_OP_PP 0
# Preprocessor type values passed to SCE_V_PCALL_OP_PP callback method
set SCE_V_PCALL_PP_INCLUDE 0
set SCE_V_PCALL_PP_IFDEF 1
set SCE_V_PCALL_PP_IFNDEF 2
set SCE_V_PCALL_PP_ELSE 3
set SCE_V_PCALL_PP_ELSIF 4
set SCE_V_PCALL_PP_ENDIF 5
# Lexical states for SCLEX_KIX
lappend lexers(Kix) SCLEX_KIX SCE_KIX_
set SCE_KIX_DEFAULT 0
set SCE_KIX_COMMENT 1
set SCE_KIX_STRING1 2
set SCE_KIX_STRING2 3
set SCE_KIX_NUMBER 4
set SCE_KIX_VAR 5
set SCE_KIX_MACRO 6
set SCE_KIX_KEYWORD 7
set SCE_KIX_FUNCTIONS 8
set SCE_KIX_OPERATOR 9
set SCE_KIX_COMMENTSTREAM 10
set SCE_KIX_IDENTIFIER 31
# Lexical states for SCLEX_GUI4CLI
lappend lexers(Gui4Cli) SCLEX_GUI4CLI SCE_GC_
set SCE_GC_DEFAULT 0
set SCE_GC_COMMENTLINE 1
set SCE_GC_COMMENTBLOCK 2
set SCE_GC_GLOBAL 3
set SCE_GC_EVENT 4
set SCE_GC_ATTRIBUTE 5
set SCE_GC_CONTROL 6
set SCE_GC_COMMAND 7
set SCE_GC_STRING 8
set SCE_GC_OPERATOR 9
# Lexical states for SCLEX_SPECMAN
lappend lexers(Specman) SCLEX_SPECMAN SCE_SN_
set SCE_SN_DEFAULT 0
set SCE_SN_CODE 1
set SCE_SN_COMMENTLINE 2
set SCE_SN_COMMENTLINEBANG 3
set SCE_SN_NUMBER 4
set SCE_SN_WORD 5
set SCE_SN_STRING 6
set SCE_SN_WORD2 7
set SCE_SN_WORD3 8
set SCE_SN_PREPROCESSOR 9
set SCE_SN_OPERATOR 10
set SCE_SN_IDENTIFIER 11
set SCE_SN_STRINGEOL 12
set SCE_SN_REGEXTAG 13
set SCE_SN_SIGNAL 14
set SCE_SN_USER 19
# Lexical states for SCLEX_AU3
lappend lexers(Au3) SCLEX_AU3 SCE_AU3_
set SCE_AU3_DEFAULT 0
set SCE_AU3_COMMENT 1
set SCE_AU3_COMMENTBLOCK 2
set SCE_AU3_NUMBER 3
set SCE_AU3_FUNCTION 4
set SCE_AU3_KEYWORD 5
set SCE_AU3_MACRO 6
set SCE_AU3_STRING 7
set SCE_AU3_OPERATOR 8
set SCE_AU3_VARIABLE 9
set SCE_AU3_SENT 10
set SCE_AU3_PREPROCESSOR 11
set SCE_AU3_SPECIAL 12
set SCE_AU3_EXPAND 13
set SCE_AU3_COMOBJ 14
set SCE_AU3_UDF 15
# Lexical states for SCLEX_APDL
lappend lexers(APDL) SCLEX_APDL SCE_APDL_
set SCE_APDL_DEFAULT 0
set SCE_APDL_COMMENT 1
set SCE_APDL_COMMENTBLOCK 2
set SCE_APDL_NUMBER 3
set SCE_APDL_STRING 4
set SCE_APDL_OPERATOR 5
set SCE_APDL_WORD 6
set SCE_APDL_PROCESSOR 7
set SCE_APDL_COMMAND 8
set SCE_APDL_SLASHCOMMAND 9
set SCE_APDL_STARCOMMAND 10
set SCE_APDL_ARGUMENT 11
set SCE_APDL_FUNCTION 12
# Lexical states for SCLEX_BASH
lappend lexers(Bash) SCLEX_BASH SCE_SH_
set SCE_SH_DEFAULT 0
set SCE_SH_ERROR 1
set SCE_SH_COMMENTLINE 2
set SCE_SH_NUMBER 3
set SCE_SH_WORD 4
set SCE_SH_STRING 5
set SCE_SH_CHARACTER 6
set SCE_SH_OPERATOR 7
set SCE_SH_IDENTIFIER 8
set SCE_SH_SCALAR 9
set SCE_SH_PARAM 10
set SCE_SH_BACKTICKS 11
set SCE_SH_HERE_DELIM 12
set SCE_SH_HERE_Q 13
# Lexical states for SCLEX_ASN1
lappend lexers(Asn1) SCLEX_ASN1 SCE_ASN1_
set SCE_ASN1_DEFAULT 0
set SCE_ASN1_COMMENT 1
set SCE_ASN1_IDENTIFIER 2
set SCE_ASN1_STRING 3
set SCE_ASN1_OID 4
set SCE_ASN1_SCALAR 5
set SCE_ASN1_KEYWORD 6
set SCE_ASN1_ATTRIBUTE 7
set SCE_ASN1_DESCRIPTOR 8
set SCE_ASN1_TYPE 9
set SCE_ASN1_OPERATOR 10
# Lexical states for SCLEX_VHDL
lappend lexers(VHDL) SCLEX_VHDL SCE_VHDL_
set SCE_VHDL_DEFAULT 0
set SCE_VHDL_COMMENT 1
set SCE_VHDL_COMMENTLINEBANG 2
set SCE_VHDL_NUMBER 3
set SCE_VHDL_STRING 4
set SCE_VHDL_OPERATOR 5
set SCE_VHDL_IDENTIFIER 6
set SCE_VHDL_STRINGEOL 7
set SCE_VHDL_KEYWORD 8
set SCE_VHDL_STDOPERATOR 9
set SCE_VHDL_ATTRIBUTE 10
set SCE_VHDL_STDFUNCTION 11
set SCE_VHDL_STDPACKAGE 12
set SCE_VHDL_STDTYPE 13
set SCE_VHDL_USERWORD 14
set SCE_VHDL_BLOCK_COMMENT 15
# Lexical states for SCLEX_CAML
lappend lexers(Caml) SCLEX_CAML SCE_CAML_
set SCE_CAML_DEFAULT 0
set SCE_CAML_IDENTIFIER 1
set SCE_CAML_TAGNAME 2
set SCE_CAML_KEYWORD 3
set SCE_CAML_KEYWORD2 4
set SCE_CAML_KEYWORD3 5
set SCE_CAML_LINENUM 6
set SCE_CAML_OPERATOR 7
set SCE_CAML_NUMBER 8
set SCE_CAML_CHAR 9
set SCE_CAML_WHITE 10
set SCE_CAML_STRING 11
set SCE_CAML_COMMENT 12
set SCE_CAML_COMMENT1 13
set SCE_CAML_COMMENT2 14
set SCE_CAML_COMMENT3 15
# Lexical states for SCLEX_HASKELL
lappend lexers(Haskell) SCLEX_HASKELL SCE_HA_
set SCE_HA_DEFAULT 0
set SCE_HA_IDENTIFIER 1
set SCE_HA_KEYWORD 2
set SCE_HA_NUMBER 3
set SCE_HA_STRING 4
set SCE_HA_CHARACTER 5
set SCE_HA_CLASS 6
set SCE_HA_MODULE 7
set SCE_HA_CAPITAL 8
set SCE_HA_DATA 9
set SCE_HA_IMPORT 10
set SCE_HA_OPERATOR 11
set SCE_HA_INSTANCE 12
set SCE_HA_COMMENTLINE 13
set SCE_HA_COMMENTBLOCK 14
set SCE_HA_COMMENTBLOCK2 15
set SCE_HA_COMMENTBLOCK3 16
set SCE_HA_PRAGMA 17
set SCE_HA_PREPROCESSOR 18
set SCE_HA_STRINGEOL 19
set SCE_HA_RESERVED_OPERATOR 20
set SCE_HA_LITERATE_COMMENT 21
set SCE_HA_LITERATE_CODEDELIM 22
# Lexical states of SCLEX_TADS3
lappend lexers(TADS3) SCLEX_TADS3 SCE_T3_
set SCE_T3_DEFAULT 0
set SCE_T3_X_DEFAULT 1
set SCE_T3_PREPROCESSOR 2
set SCE_T3_BLOCK_COMMENT 3
set SCE_T3_LINE_COMMENT 4
set SCE_T3_OPERATOR 5
set SCE_T3_KEYWORD 6
set SCE_T3_NUMBER 7
set SCE_T3_IDENTIFIER 8
set SCE_T3_S_STRING 9
set SCE_T3_D_STRING 10
set SCE_T3_X_STRING 11
set SCE_T3_LIB_DIRECTIVE 12
set SCE_T3_MSG_PARAM 13
set SCE_T3_HTML_TAG 14
set SCE_T3_HTML_DEFAULT 15
set SCE_T3_HTML_STRING 16
set SCE_T3_USER1 17
set SCE_T3_USER2 18
set SCE_T3_USER3 19
set SCE_T3_BRACE 20
# Lexical states for SCLEX_REBOL
lappend lexers(Rebol) SCLEX_REBOL SCE_REBOL_
set SCE_REBOL_DEFAULT 0
set SCE_REBOL_COMMENTLINE 1
set SCE_REBOL_COMMENTBLOCK 2
set SCE_REBOL_PREFACE 3
set SCE_REBOL_OPERATOR 4
set SCE_REBOL_CHARACTER 5
set SCE_REBOL_QUOTEDSTRING 6
set SCE_REBOL_BRACEDSTRING 7
set SCE_REBOL_NUMBER 8
set SCE_REBOL_PAIR 9
set SCE_REBOL_TUPLE 10
set SCE_REBOL_BINARY 11
set SCE_REBOL_MONEY 12
set SCE_REBOL_ISSUE 13
set SCE_REBOL_TAG 14
set SCE_REBOL_FILE 15
set SCE_REBOL_EMAIL 16
set SCE_REBOL_URL 17
set SCE_REBOL_DATE 18
set SCE_REBOL_TIME 19
set SCE_REBOL_IDENTIFIER 20
set SCE_REBOL_WORD 21
set SCE_REBOL_WORD2 22
set SCE_REBOL_WORD3 23
set SCE_REBOL_WORD4 24
set SCE_REBOL_WORD5 25
set SCE_REBOL_WORD6 26
set SCE_REBOL_WORD7 27
set SCE_REBOL_WORD8 28
# Lexical states for SCLEX_SQL
lappend lexers(SQL) SCLEX_SQL SCE_SQL_
set SCE_SQL_DEFAULT 0
set SCE_SQL_COMMENT 1
set SCE_SQL_COMMENTLINE 2
set SCE_SQL_COMMENTDOC 3
set SCE_SQL_NUMBER 4
set SCE_SQL_WORD 5
set SCE_SQL_STRING 6
set SCE_SQL_CHARACTER 7
set SCE_SQL_SQLPLUS 8
set SCE_SQL_SQLPLUS_PROMPT 9
set SCE_SQL_OPERATOR 10
set SCE_SQL_IDENTIFIER 11
set SCE_SQL_SQLPLUS_COMMENT 13
set SCE_SQL_COMMENTLINEDOC 15
set SCE_SQL_WORD2 16
set SCE_SQL_COMMENTDOCKEYWORD 17
set SCE_SQL_COMMENTDOCKEYWORDERROR 18
set SCE_SQL_USER1 19
set SCE_SQL_USER2 20
set SCE_SQL_USER3 21
set SCE_SQL_USER4 22
set SCE_SQL_QUOTEDIDENTIFIER 23
set SCE_SQL_QOPERATOR 24
# Lexical states for SCLEX_SMALLTALK
lappend lexers(Smalltalk) SCLEX_SMALLTALK SCE_ST_
set SCE_ST_DEFAULT 0
set SCE_ST_STRING 1
set SCE_ST_NUMBER 2
set SCE_ST_COMMENT 3
set SCE_ST_SYMBOL 4
set SCE_ST_BINARY 5
set SCE_ST_BOOL 6
set SCE_ST_SELF 7
set SCE_ST_SUPER 8
set SCE_ST_NIL 9
set SCE_ST_GLOBAL 10
set SCE_ST_RETURN 11
set SCE_ST_SPECIAL 12
set SCE_ST_KWSEND 13
set SCE_ST_ASSIGN 14
set SCE_ST_CHARACTER 15
set SCE_ST_SPEC_SEL 16
# Lexical states for SCLEX_FLAGSHIP (clipper)
lappend lexers(FlagShip) SCLEX_FLAGSHIP SCE_FS_
set SCE_FS_DEFAULT 0
set SCE_FS_COMMENT 1
set SCE_FS_COMMENTLINE 2
set SCE_FS_COMMENTDOC 3
set SCE_FS_COMMENTLINEDOC 4
set SCE_FS_COMMENTDOCKEYWORD 5
set SCE_FS_COMMENTDOCKEYWORDERROR 6
set SCE_FS_KEYWORD 7
set SCE_FS_KEYWORD2 8
set SCE_FS_KEYWORD3 9
set SCE_FS_KEYWORD4 10
set SCE_FS_NUMBER 11
set SCE_FS_STRING 12
set SCE_FS_PREPROCESSOR 13
set SCE_FS_OPERATOR 14
set SCE_FS_IDENTIFIER 15
set SCE_FS_DATE 16
set SCE_FS_STRINGEOL 17
set SCE_FS_CONSTANT 18
set SCE_FS_WORDOPERATOR 19
set SCE_FS_DISABLEDCODE 20
set SCE_FS_DEFAULT_C 21
set SCE_FS_COMMENTDOC_C 22
set SCE_FS_COMMENTLINEDOC_C 23
set SCE_FS_KEYWORD_C 24
set SCE_FS_KEYWORD2_C 25
set SCE_FS_NUMBER_C 26
set SCE_FS_STRING_C 27
set SCE_FS_PREPROCESSOR_C 28
set SCE_FS_OPERATOR_C 29
set SCE_FS_IDENTIFIER_C 30
set SCE_FS_STRINGEOL_C 31
# Lexical states for SCLEX_CSOUND
lappend lexers(Csound) SCLEX_CSOUND SCE_CSOUND_
set SCE_CSOUND_DEFAULT 0
set SCE_CSOUND_COMMENT 1
set SCE_CSOUND_NUMBER 2
set SCE_CSOUND_OPERATOR 3
set SCE_CSOUND_INSTR 4
set SCE_CSOUND_IDENTIFIER 5
set SCE_CSOUND_OPCODE 6
set SCE_CSOUND_HEADERSTMT 7
set SCE_CSOUND_USERKEYWORD 8
set SCE_CSOUND_COMMENTBLOCK 9
set SCE_CSOUND_PARAM 10
set SCE_CSOUND_ARATE_VAR 11
set SCE_CSOUND_KRATE_VAR 12
set SCE_CSOUND_IRATE_VAR 13
set SCE_CSOUND_GLOBAL_VAR 14
set SCE_CSOUND_STRINGEOL 15
# Lexical states for SCLEX_INNOSETUP
lappend lexers(Inno) SCLEX_INNOSETUP SCE_INNO_
set SCE_INNO_DEFAULT 0
set SCE_INNO_COMMENT 1
set SCE_INNO_KEYWORD 2
set SCE_INNO_PARAMETER 3
set SCE_INNO_SECTION 4
set SCE_INNO_PREPROC 5
set SCE_INNO_INLINE_EXPANSION 6
set SCE_INNO_COMMENT_PASCAL 7
set SCE_INNO_KEYWORD_PASCAL 8
set SCE_INNO_KEYWORD_USER 9
set SCE_INNO_STRING_DOUBLE 10
set SCE_INNO_STRING_SINGLE 11
set SCE_INNO_IDENTIFIER 12
# Lexical states for SCLEX_OPAL
lappend lexers(Opal) SCLEX_OPAL SCE_OPAL_
set SCE_OPAL_SPACE 0
set SCE_OPAL_COMMENT_BLOCK 1
set SCE_OPAL_COMMENT_LINE 2
set SCE_OPAL_INTEGER 3
set SCE_OPAL_KEYWORD 4
set SCE_OPAL_SORT 5
set SCE_OPAL_STRING 6
set SCE_OPAL_PAR 7
set SCE_OPAL_BOOL_CONST 8
set SCE_OPAL_DEFAULT 32
# Lexical states for SCLEX_SPICE
lappend lexers(Spice) SCLEX_SPICE SCE_SPICE_
set SCE_SPICE_DEFAULT 0
set SCE_SPICE_IDENTIFIER 1
set SCE_SPICE_KEYWORD 2
set SCE_SPICE_KEYWORD2 3
set SCE_SPICE_KEYWORD3 4
set SCE_SPICE_NUMBER 5
set SCE_SPICE_DELIMITER 6
set SCE_SPICE_VALUE 7
set SCE_SPICE_COMMENTLINE 8
# Lexical states for SCLEX_CMAKE
lappend lexers(CMAKE) SCLEX_CMAKE SCE_CMAKE_
set SCE_CMAKE_DEFAULT 0
set SCE_CMAKE_COMMENT 1
set SCE_CMAKE_STRINGDQ 2
set SCE_CMAKE_STRINGLQ 3
set SCE_CMAKE_STRINGRQ 4
set SCE_CMAKE_COMMANDS 5
set SCE_CMAKE_PARAMETERS 6
set SCE_CMAKE_VARIABLE 7
set SCE_CMAKE_USERDEFINED 8
set SCE_CMAKE_WHILEDEF 9
set SCE_CMAKE_FOREACHDEF 10
set SCE_CMAKE_IFDEFINEDEF 11
set SCE_CMAKE_MACRODEF 12
set SCE_CMAKE_STRINGVAR 13
set SCE_CMAKE_NUMBER 14
# Lexical states for SCLEX_GAP
lappend lexers(Gap) SCLEX_GAP SCE_GAP_
set SCE_GAP_DEFAULT 0
set SCE_GAP_IDENTIFIER 1
set SCE_GAP_KEYWORD 2
set SCE_GAP_KEYWORD2 3
set SCE_GAP_KEYWORD3 4
set SCE_GAP_KEYWORD4 5
set SCE_GAP_STRING 6
set SCE_GAP_CHAR 7
set SCE_GAP_OPERATOR 8
set SCE_GAP_COMMENT 9
set SCE_GAP_NUMBER 10
set SCE_GAP_STRINGEOL 11
# Lexical state for SCLEX_PLM
lappend lexers(PLM) SCLEX_PLM SCE_PLM_
set SCE_PLM_DEFAULT 0
set SCE_PLM_COMMENT 1
set SCE_PLM_STRING 2
set SCE_PLM_NUMBER 3
set SCE_PLM_IDENTIFIER 4
set SCE_PLM_OPERATOR 5
set SCE_PLM_CONTROL 6
set SCE_PLM_KEYWORD 7
# Lexical state for SCLEX_PROGRESS
lappend lexers(Progress) SCLEX_PROGRESS SCE_4GL_
set SCE_4GL_DEFAULT 0
set SCE_4GL_NUMBER 1
set SCE_4GL_WORD 2
set SCE_4GL_STRING 3
set SCE_4GL_CHARACTER 4
set SCE_4GL_PREPROCESSOR 5
set SCE_4GL_OPERATOR 6
set SCE_4GL_IDENTIFIER 7
set SCE_4GL_BLOCK 8
set SCE_4GL_END 9
set SCE_4GL_COMMENT1 10
set SCE_4GL_COMMENT2 11
set SCE_4GL_COMMENT3 12
set SCE_4GL_COMMENT4 13
set SCE_4GL_COMMENT5 14
set SCE_4GL_COMMENT6 15
set SCE_4GL_DEFAULT_ 16
set SCE_4GL_NUMBER_ 17
set SCE_4GL_WORD_ 18
set SCE_4GL_STRING_ 19
set SCE_4GL_CHARACTER_ 20
set SCE_4GL_PREPROCESSOR_ 21
set SCE_4GL_OPERATOR_ 22
set SCE_4GL_IDENTIFIER_ 23
set SCE_4GL_BLOCK_ 24
set SCE_4GL_END_ 25
set SCE_4GL_COMMENT1_ 26
set SCE_4GL_COMMENT2_ 27
set SCE_4GL_COMMENT3_ 28
set SCE_4GL_COMMENT4_ 29
set SCE_4GL_COMMENT5_ 30
set SCE_4GL_COMMENT6_ 31
# Lexical states for SCLEX_ABAQUS
lappend lexers(ABAQUS) SCLEX_ABAQUS SCE_ABAQUS_
set SCE_ABAQUS_DEFAULT 0
set SCE_ABAQUS_COMMENT 1
set SCE_ABAQUS_COMMENTBLOCK 2
set SCE_ABAQUS_NUMBER 3
set SCE_ABAQUS_STRING 4
set SCE_ABAQUS_OPERATOR 5
set SCE_ABAQUS_WORD 6
set SCE_ABAQUS_PROCESSOR 7
set SCE_ABAQUS_COMMAND 8
set SCE_ABAQUS_SLASHCOMMAND 9
set SCE_ABAQUS_STARCOMMAND 10
set SCE_ABAQUS_ARGUMENT 11
set SCE_ABAQUS_FUNCTION 12
# Lexical states for SCLEX_ASYMPTOTE
lappend lexers(Asymptote) SCLEX_ASYMPTOTE SCE_ASY_
set SCE_ASY_DEFAULT 0
set SCE_ASY_COMMENT 1
set SCE_ASY_COMMENTLINE 2
set SCE_ASY_NUMBER 3
set SCE_ASY_WORD 4
set SCE_ASY_STRING 5
set SCE_ASY_CHARACTER 6
set SCE_ASY_OPERATOR 7
set SCE_ASY_IDENTIFIER 8
set SCE_ASY_STRINGEOL 9
set SCE_ASY_COMMENTLINEDOC 10
set SCE_ASY_WORD2 11
# Lexical states for SCLEX_R
lappend lexers(R) SCLEX_R SCE_R_
set SCE_R_DEFAULT 0
set SCE_R_COMMENT 1
set SCE_R_KWORD 2
set SCE_R_BASEKWORD 3
set SCE_R_OTHERKWORD 4
set SCE_R_NUMBER 5
set SCE_R_STRING 6
set SCE_R_STRING2 7
set SCE_R_OPERATOR 8
set SCE_R_IDENTIFIER 9
set SCE_R_INFIX 10
set SCE_R_INFIXEOL 11
# Lexical state for SCLEX_MAGIK
lappend lexers(MagikSF) SCLEX_MAGIK SCE_MAGIK_
set SCE_MAGIK_DEFAULT 0
set SCE_MAGIK_COMMENT 1
set SCE_MAGIK_HYPER_COMMENT 16
set SCE_MAGIK_STRING 2
set SCE_MAGIK_CHARACTER 3
set SCE_MAGIK_NUMBER 4
set SCE_MAGIK_IDENTIFIER 5
set SCE_MAGIK_OPERATOR 6
set SCE_MAGIK_FLOW 7
set SCE_MAGIK_CONTAINER 8
set SCE_MAGIK_BRACKET_BLOCK 9
set SCE_MAGIK_BRACE_BLOCK 10
set SCE_MAGIK_SQBRACKET_BLOCK 11
set SCE_MAGIK_UNKNOWN_KEYWORD 12
set SCE_MAGIK_KEYWORD 13
set SCE_MAGIK_PRAGMA 14
set SCE_MAGIK_SYMBOL 15
# Lexical state for SCLEX_POWERSHELL
lappend lexers(PowerShell) SCLEX_POWERSHELL SCE_POWERSHELL_
set SCE_POWERSHELL_DEFAULT 0
set SCE_POWERSHELL_COMMENT 1
set SCE_POWERSHELL_STRING 2
set SCE_POWERSHELL_CHARACTER 3
set SCE_POWERSHELL_NUMBER 4
set SCE_POWERSHELL_VARIABLE 5
set SCE_POWERSHELL_OPERATOR 6
set SCE_POWERSHELL_IDENTIFIER 7
set SCE_POWERSHELL_KEYWORD 8
set SCE_POWERSHELL_CMDLET 9
set SCE_POWERSHELL_ALIAS 10
set SCE_POWERSHELL_FUNCTION 11
set SCE_POWERSHELL_USER1 12
set SCE_POWERSHELL_COMMENTSTREAM 13
set SCE_POWERSHELL_HERE_STRING 14
set SCE_POWERSHELL_HERE_CHARACTER 15
set SCE_POWERSHELL_COMMENTDOCKEYWORD 16
# Lexical state for SCLEX_MYSQL
lappend lexers(MySQL) SCLEX_MYSQL SCE_MYSQL_
set SCE_MYSQL_DEFAULT 0
set SCE_MYSQL_COMMENT 1
set SCE_MYSQL_COMMENTLINE 2
set SCE_MYSQL_VARIABLE 3
set SCE_MYSQL_SYSTEMVARIABLE 4
set SCE_MYSQL_KNOWNSYSTEMVARIABLE 5
set SCE_MYSQL_NUMBER 6
set SCE_MYSQL_MAJORKEYWORD 7
set SCE_MYSQL_KEYWORD 8
set SCE_MYSQL_DATABASEOBJECT 9
set SCE_MYSQL_PROCEDUREKEYWORD 10
set SCE_MYSQL_STRING 11
set SCE_MYSQL_SQSTRING 12
set SCE_MYSQL_DQSTRING 13
set SCE_MYSQL_OPERATOR 14
set SCE_MYSQL_FUNCTION 15
set SCE_MYSQL_IDENTIFIER 16
set SCE_MYSQL_QUOTEDIDENTIFIER 17
set SCE_MYSQL_USER1 18
set SCE_MYSQL_USER2 19
set SCE_MYSQL_USER3 20
set SCE_MYSQL_HIDDENCOMMAND 21
set SCE_MYSQL_PLACEHOLDER 22
# Lexical state for SCLEX_PO
lappend lexers(Po) SCLEX_PO SCE_PO_
set SCE_PO_DEFAULT 0
set SCE_PO_COMMENT 1
set SCE_PO_MSGID 2
set SCE_PO_MSGID_TEXT 3
set SCE_PO_MSGSTR 4
set SCE_PO_MSGSTR_TEXT 5
set SCE_PO_MSGCTXT 6
set SCE_PO_MSGCTXT_TEXT 7
set SCE_PO_FUZZY 8
set SCE_PO_PROGRAMMER_COMMENT 9
set SCE_PO_REFERENCE 10
set SCE_PO_FLAGS 11
set SCE_PO_MSGID_TEXT_EOL 12
set SCE_PO_MSGSTR_TEXT_EOL 13
set SCE_PO_MSGCTXT_TEXT_EOL 14
set SCE_PO_ERROR 15
# Lexical states for SCLEX_PASCAL
lappend lexers(Pascal) SCLEX_PASCAL SCE_PAS_
set SCE_PAS_DEFAULT 0
set SCE_PAS_IDENTIFIER 1
set SCE_PAS_COMMENT 2
set SCE_PAS_COMMENT2 3
set SCE_PAS_COMMENTLINE 4
set SCE_PAS_PREPROCESSOR 5
set SCE_PAS_PREPROCESSOR2 6
set SCE_PAS_NUMBER 7
set SCE_PAS_HEXNUMBER 8
set SCE_PAS_WORD 9
set SCE_PAS_STRING 10
set SCE_PAS_STRINGEOL 11
set SCE_PAS_CHARACTER 12
set SCE_PAS_OPERATOR 13
set SCE_PAS_ASM 14
# Lexical state for SCLEX_SORCUS
lappend lexers(SORCUS) SCLEX_SORCUS SCE_SORCUS_
set SCE_SORCUS_DEFAULT 0
set SCE_SORCUS_COMMAND 1
set SCE_SORCUS_PARAMETER 2
set SCE_SORCUS_COMMENTLINE 3
set SCE_SORCUS_STRING 4
set SCE_SORCUS_STRINGEOL 5
set SCE_SORCUS_IDENTIFIER 6
set SCE_SORCUS_OPERATOR 7
set SCE_SORCUS_NUMBER 8
set SCE_SORCUS_CONSTANT 9
# Lexical state for SCLEX_POWERPRO
lappend lexers(PowerPro) SCLEX_POWERPRO SCE_POWERPRO_
set SCE_POWERPRO_DEFAULT 0
set SCE_POWERPRO_COMMENTBLOCK 1
set SCE_POWERPRO_COMMENTLINE 2
set SCE_POWERPRO_NUMBER 3
set SCE_POWERPRO_WORD 4
set SCE_POWERPRO_WORD2 5
set SCE_POWERPRO_WORD3 6
set SCE_POWERPRO_WORD4 7
set SCE_POWERPRO_DOUBLEQUOTEDSTRING 8
set SCE_POWERPRO_SINGLEQUOTEDSTRING 9
set SCE_POWERPRO_LINECONTINUE 10
set SCE_POWERPRO_OPERATOR 11
set SCE_POWERPRO_IDENTIFIER 12
set SCE_POWERPRO_STRINGEOL 13
set SCE_POWERPRO_VERBATIM 14
set SCE_POWERPRO_ALTQUOTE 15
set SCE_POWERPRO_FUNCTION 16
# Lexical states for SCLEX_SML
lappend lexers(SML) SCLEX_SML SCE_SML_
set SCE_SML_DEFAULT 0
set SCE_SML_IDENTIFIER 1
set SCE_SML_TAGNAME 2
set SCE_SML_KEYWORD 3
set SCE_SML_KEYWORD2 4
set SCE_SML_KEYWORD3 5
set SCE_SML_LINENUM 6
set SCE_SML_OPERATOR 7
set SCE_SML_NUMBER 8
set SCE_SML_CHAR 9
set SCE_SML_STRING 11
set SCE_SML_COMMENT 12
set SCE_SML_COMMENT1 13
set SCE_SML_COMMENT2 14
set SCE_SML_COMMENT3 15
# Lexical state for SCLEX_MARKDOWN
lappend lexers(Markdown) SCLEX_MARKDOWN SCE_MARKDOWN_
set SCE_MARKDOWN_DEFAULT 0
set SCE_MARKDOWN_LINE_BEGIN 1
set SCE_MARKDOWN_STRONG1 2
set SCE_MARKDOWN_STRONG2 3
set SCE_MARKDOWN_EM1 4
set SCE_MARKDOWN_EM2 5
set SCE_MARKDOWN_HEADER1 6
set SCE_MARKDOWN_HEADER2 7
set SCE_MARKDOWN_HEADER3 8
set SCE_MARKDOWN_HEADER4 9
set SCE_MARKDOWN_HEADER5 10
set SCE_MARKDOWN_HEADER6 11
set SCE_MARKDOWN_PRECHAR 12
set SCE_MARKDOWN_ULIST_ITEM 13
set SCE_MARKDOWN_OLIST_ITEM 14
set SCE_MARKDOWN_BLOCKQUOTE 15
set SCE_MARKDOWN_STRIKEOUT 16
set SCE_MARKDOWN_HRULE 17
set SCE_MARKDOWN_LINK 18
set SCE_MARKDOWN_CODE 19
set SCE_MARKDOWN_CODE2 20
set SCE_MARKDOWN_CODEBK 21
# Lexical state for SCLEX_TXT2TAGS
lappend lexers(Txt2tags) SCLEX_TXT2TAGS SCE_TXT2TAGS_
set SCE_TXT2TAGS_DEFAULT 0
set SCE_TXT2TAGS_LINE_BEGIN 1
set SCE_TXT2TAGS_STRONG1 2
set SCE_TXT2TAGS_STRONG2 3
set SCE_TXT2TAGS_EM1 4
set SCE_TXT2TAGS_EM2 5
set SCE_TXT2TAGS_HEADER1 6
set SCE_TXT2TAGS_HEADER2 7
set SCE_TXT2TAGS_HEADER3 8
set SCE_TXT2TAGS_HEADER4 9
set SCE_TXT2TAGS_HEADER5 10
set SCE_TXT2TAGS_HEADER6 11
set SCE_TXT2TAGS_PRECHAR 12
set SCE_TXT2TAGS_ULIST_ITEM 13
set SCE_TXT2TAGS_OLIST_ITEM 14
set SCE_TXT2TAGS_BLOCKQUOTE 15
set SCE_TXT2TAGS_STRIKEOUT 16
set SCE_TXT2TAGS_HRULE 17
set SCE_TXT2TAGS_LINK 18
set SCE_TXT2TAGS_CODE 19
set SCE_TXT2TAGS_CODE2 20
set SCE_TXT2TAGS_CODEBK 21
set SCE_TXT2TAGS_COMMENT 22
set SCE_TXT2TAGS_OPTION 23
set SCE_TXT2TAGS_PREPROC 24
set SCE_TXT2TAGS_POSTPROC 25
# Lexical states for SCLEX_A68K
lappend lexers(A68k) SCLEX_A68K SCE_A68K_
set SCE_A68K_DEFAULT 0
set SCE_A68K_COMMENT 1
set SCE_A68K_NUMBER_DEC 2
set SCE_A68K_NUMBER_BIN 3
set SCE_A68K_NUMBER_HEX 4
set SCE_A68K_STRING1 5
set SCE_A68K_OPERATOR 6
set SCE_A68K_CPUINSTRUCTION 7
set SCE_A68K_EXTINSTRUCTION 8
set SCE_A68K_REGISTER 9
set SCE_A68K_DIRECTIVE 10
set SCE_A68K_MACRO_ARG 11
set SCE_A68K_LABEL 12
set SCE_A68K_STRING2 13
set SCE_A68K_IDENTIFIER 14
set SCE_A68K_MACRO_DECLARATION 15
set SCE_A68K_COMMENT_WORD 16
set SCE_A68K_COMMENT_SPECIAL 17
set SCE_A68K_COMMENT_DOXYGEN 18
# Lexical states for SCLEX_MODULA
lappend lexers(Modula) SCLEX_MODULA SCE_MODULA_
set SCE_MODULA_DEFAULT 0
set SCE_MODULA_COMMENT 1
set SCE_MODULA_DOXYCOMM 2
set SCE_MODULA_DOXYKEY 3
set SCE_MODULA_KEYWORD 4
set SCE_MODULA_RESERVED 5
set SCE_MODULA_NUMBER 6
set SCE_MODULA_BASENUM 7
set SCE_MODULA_FLOAT 8
set SCE_MODULA_STRING 9
set SCE_MODULA_STRSPEC 10
set SCE_MODULA_CHAR 11
set SCE_MODULA_CHARSPEC 12
set SCE_MODULA_PROC 13
set SCE_MODULA_PRAGMA 14
set SCE_MODULA_PRGKEY 15
set SCE_MODULA_OPERATOR 16
set SCE_MODULA_BADSTR 17
# Lexical states for SCLEX_COFFEESCRIPT
lappend lexers(CoffeeScript) SCLEX_COFFEESCRIPT SCE_COFFEESCRIPT_
set SCE_COFFEESCRIPT_DEFAULT 0
set SCE_COFFEESCRIPT_COMMENT 1
set SCE_COFFEESCRIPT_COMMENTLINE 2
set SCE_COFFEESCRIPT_COMMENTDOC 3
set SCE_COFFEESCRIPT_NUMBER 4
set SCE_COFFEESCRIPT_WORD 5
set SCE_COFFEESCRIPT_STRING 6
set SCE_COFFEESCRIPT_CHARACTER 7
set SCE_COFFEESCRIPT_UUID 8
set SCE_COFFEESCRIPT_PREPROCESSOR 9
set SCE_COFFEESCRIPT_OPERATOR 10
set SCE_COFFEESCRIPT_IDENTIFIER 11
set SCE_COFFEESCRIPT_STRINGEOL 12
set SCE_COFFEESCRIPT_VERBATIM 13
set SCE_COFFEESCRIPT_REGEX 14
set SCE_COFFEESCRIPT_COMMENTLINEDOC 15
set SCE_COFFEESCRIPT_WORD2 16
set SCE_COFFEESCRIPT_COMMENTDOCKEYWORD 17
set SCE_COFFEESCRIPT_COMMENTDOCKEYWORDERROR 18
set SCE_COFFEESCRIPT_GLOBALCLASS 19
set SCE_COFFEESCRIPT_STRINGRAW 20
set SCE_COFFEESCRIPT_TRIPLEVERBATIM 21
set SCE_COFFEESCRIPT_COMMENTBLOCK 22
set SCE_COFFEESCRIPT_VERBOSE_REGEX 23
set SCE_COFFEESCRIPT_VERBOSE_REGEX_COMMENT 24
set SCE_COFFEESCRIPT_INSTANCEPROPERTY 25
# Lexical states for SCLEX_AVS
lappend lexers(AVS) SCLEX_AVS SCE_AVS_
set SCE_AVS_DEFAULT 0
set SCE_AVS_COMMENTBLOCK 1
set SCE_AVS_COMMENTBLOCKN 2
set SCE_AVS_COMMENTLINE 3
set SCE_AVS_NUMBER 4
set SCE_AVS_OPERATOR 5
set SCE_AVS_IDENTIFIER 6
set SCE_AVS_STRING 7
set SCE_AVS_TRIPLESTRING 8
set SCE_AVS_KEYWORD 9
set SCE_AVS_FILTER 10
set SCE_AVS_PLUGIN 11
set SCE_AVS_FUNCTION 12
set SCE_AVS_CLIPPROP 13
set SCE_AVS_USERDFN 14
# Lexical states for SCLEX_ECL
lappend lexers(ECL) SCLEX_ECL SCE_ECL_
set SCE_ECL_DEFAULT 0
set SCE_ECL_COMMENT 1
set SCE_ECL_COMMENTLINE 2
set SCE_ECL_NUMBER 3
set SCE_ECL_STRING 4
set SCE_ECL_WORD0 5
set SCE_ECL_OPERATOR 6
set SCE_ECL_CHARACTER 7
set SCE_ECL_UUID 8
set SCE_ECL_PREPROCESSOR 9
set SCE_ECL_UNKNOWN 10
set SCE_ECL_IDENTIFIER 11
set SCE_ECL_STRINGEOL 12
set SCE_ECL_VERBATIM 13
set SCE_ECL_REGEX 14
set SCE_ECL_COMMENTLINEDOC 15
set SCE_ECL_WORD1 16
set SCE_ECL_COMMENTDOCKEYWORD 17
set SCE_ECL_COMMENTDOCKEYWORDERROR 18
set SCE_ECL_WORD2 19
set SCE_ECL_WORD3 20
set SCE_ECL_WORD4 21
set SCE_ECL_WORD5 22
set SCE_ECL_COMMENTDOC 23
set SCE_ECL_ADDED 24
set SCE_ECL_DELETED 25
set SCE_ECL_CHANGED 26
set SCE_ECL_MOVED 27
# Lexical states for SCLEX_OSCRIPT
lappend lexers(OScript) SCLEX_OSCRIPT SCE_OSCRIPT_
set SCE_OSCRIPT_DEFAULT 0
set SCE_OSCRIPT_LINE_COMMENT 1
set SCE_OSCRIPT_BLOCK_COMMENT 2
set SCE_OSCRIPT_DOC_COMMENT 3
set SCE_OSCRIPT_PREPROCESSOR 4
set SCE_OSCRIPT_NUMBER 5
set SCE_OSCRIPT_SINGLEQUOTE_STRING 6
set SCE_OSCRIPT_DOUBLEQUOTE_STRING 7
set SCE_OSCRIPT_CONSTANT 8
set SCE_OSCRIPT_IDENTIFIER 9
set SCE_OSCRIPT_GLOBAL 10
set SCE_OSCRIPT_KEYWORD 11
set SCE_OSCRIPT_OPERATOR 12
set SCE_OSCRIPT_LABEL 13
set SCE_OSCRIPT_TYPE 14
set SCE_OSCRIPT_FUNCTION 15
set SCE_OSCRIPT_OBJECT 16
set SCE_OSCRIPT_PROPERTY 17
set SCE_OSCRIPT_METHOD 18
# Lexical states for SCLEX_VISUALPROLOG
lappend lexers(VisualProlog) SCLEX_VISUALPROLOG SCE_VISUALPROLOG_
set SCE_VISUALPROLOG_DEFAULT 0
set SCE_VISUALPROLOG_KEY_MAJOR 1
set SCE_VISUALPROLOG_KEY_MINOR 2
set SCE_VISUALPROLOG_KEY_DIRECTIVE 3
set SCE_VISUALPROLOG_COMMENT_BLOCK 4
set SCE_VISUALPROLOG_COMMENT_LINE 5
set SCE_VISUALPROLOG_COMMENT_KEY 6
set SCE_VISUALPROLOG_COMMENT_KEY_ERROR 7
set SCE_VISUALPROLOG_IDENTIFIER 8
set SCE_VISUALPROLOG_VARIABLE 9
set SCE_VISUALPROLOG_ANONYMOUS 10
set SCE_VISUALPROLOG_NUMBER 11
set SCE_VISUALPROLOG_OPERATOR 12
set SCE_VISUALPROLOG_CHARACTER 13
set SCE_VISUALPROLOG_CHARACTER_TOO_MANY 14
set SCE_VISUALPROLOG_CHARACTER_ESCAPE_ERROR 15
set SCE_VISUALPROLOG_STRING 16
set SCE_VISUALPROLOG_STRING_ESCAPE 17
set SCE_VISUALPROLOG_STRING_ESCAPE_ERROR 18
set SCE_VISUALPROLOG_STRING_EOL_OPEN 19
set SCE_VISUALPROLOG_STRING_VERBATIM 20
set SCE_VISUALPROLOG_STRING_VERBATIM_SPECIAL 21
set SCE_VISUALPROLOG_STRING_VERBATIM_EOL 22
# Lexical states for SCLEX_STTXT
lappend lexers(StructuredText) SCLEX_STTXT SCE_STTXT_
set SCE_STTXT_DEFAULT 0
set SCE_STTXT_COMMENT 1
set SCE_STTXT_COMMENTLINE 2
set SCE_STTXT_KEYWORD 3
set SCE_STTXT_TYPE 4
set SCE_STTXT_FUNCTION 5
set SCE_STTXT_FB 6
set SCE_STTXT_NUMBER 7
set SCE_STTXT_HEXNUMBER 8
set SCE_STTXT_PRAGMA 9
set SCE_STTXT_OPERATOR 10
set SCE_STTXT_CHARACTER 11
set SCE_STTXT_STRING1 12
set SCE_STTXT_STRING2 13
set SCE_STTXT_STRINGEOL 14
set SCE_STTXT_IDENTIFIER 15
set SCE_STTXT_DATETIME 16
set SCE_STTXT_VARS 17
set SCE_STTXT_PRAGMAS 18
# Lexical states for SCLEX_KVIRC
lappend lexers(KVIrc) SCLEX_KVIRC SCE_KVIRC_
set SCE_KVIRC_DEFAULT 0
set SCE_KVIRC_COMMENT 1
set SCE_KVIRC_COMMENTBLOCK 2
set SCE_KVIRC_STRING 3
set SCE_KVIRC_WORD 4
set SCE_KVIRC_KEYWORD 5
set SCE_KVIRC_FUNCTION_KEYWORD 6
set SCE_KVIRC_FUNCTION 7
set SCE_KVIRC_VARIABLE 8
set SCE_KVIRC_NUMBER 9
set SCE_KVIRC_OPERATOR 10
set SCE_KVIRC_STRING_FUNCTION 11
set SCE_KVIRC_STRING_VARIABLE 12
# Lexical states for SCLEX_RUST
lappend lexers(Rust) SCLEX_RUST SCE_RUST_
set SCE_RUST_DEFAULT 0
set SCE_RUST_COMMENTBLOCK 1
set SCE_RUST_COMMENTLINE 2
set SCE_RUST_COMMENTBLOCKDOC 3
set SCE_RUST_COMMENTLINEDOC 4
set SCE_RUST_NUMBER 5
set SCE_RUST_WORD 6
set SCE_RUST_WORD2 7
set SCE_RUST_WORD3 8
set SCE_RUST_WORD4 9
set SCE_RUST_WORD5 10
set SCE_RUST_WORD6 11
set SCE_RUST_WORD7 12
set SCE_RUST_STRING 13
set SCE_RUST_STRINGR 14
set SCE_RUST_CHARACTER 15
set SCE_RUST_OPERATOR 16
set SCE_RUST_IDENTIFIER 17
set SCE_RUST_LIFETIME 18
set SCE_RUST_MACRO 19
set SCE_RUST_LEXERROR 20
set SCE_RUST_BYTESTRING 21
set SCE_RUST_BYTESTRINGR 22
set SCE_RUST_BYTECHARACTER 23
# Lexical states for SCLEX_DMAP
lappend lexers(DMAP) SCLEX_DMAP SCE_DMAP_
set SCE_DMAP_DEFAULT 0
set SCE_DMAP_COMMENT 1
set SCE_DMAP_NUMBER 2
set SCE_DMAP_STRING1 3
set SCE_DMAP_STRING2 4
set SCE_DMAP_STRINGEOL 5
set SCE_DMAP_OPERATOR 6
set SCE_DMAP_IDENTIFIER 7
set SCE_DMAP_WORD 8
set SCE_DMAP_WORD2 9
set SCE_DMAP_WORD3 10
# Lexical states for SCLEX_DMIS
lappend lexers(DMIS) SCLEX_DMIS SCE_DMIS_
set SCE_DMIS_DEFAULT 0
set SCE_DMIS_COMMENT 1
set SCE_DMIS_STRING 2
set SCE_DMIS_NUMBER 3
set SCE_DMIS_KEYWORD 4
set SCE_DMIS_MAJORWORD 5
set SCE_DMIS_MINORWORD 6
set SCE_DMIS_UNSUPPORTED_MAJOR 7
set SCE_DMIS_UNSUPPORTED_MINOR 8
set SCE_DMIS_LABEL 9
# Lexical states for SCLEX_REGISTRY
lappend lexers(REG) SCLEX_REGISTRY SCE_REG_
set SCE_REG_DEFAULT 0
set SCE_REG_COMMENT 1
set SCE_REG_VALUENAME 2
set SCE_REG_STRING 3
set SCE_REG_HEXDIGIT 4
set SCE_REG_VALUETYPE 5
set SCE_REG_ADDEDKEY 6
set SCE_REG_DELETEDKEY 7
set SCE_REG_ESCAPED 8
set SCE_REG_KEYPATH_GUID 9
set SCE_REG_STRING_GUID 10
set SCE_REG_PARAMETER 11
set SCE_REG_OPERATOR 12
# Lexical state for SCLEX_BIBTEX
lappend lexers(BibTeX) SCLEX_BIBTEX SCE_BIBTEX_
set SCE_BIBTEX_DEFAULT 0
set SCE_BIBTEX_ENTRY 1
set SCE_BIBTEX_UNKNOWN_ENTRY 2
set SCE_BIBTEX_KEY 3
set SCE_BIBTEX_PARAMETER 4
set SCE_BIBTEX_VALUE 5
set SCE_BIBTEX_COMMENT 6
# Lexical state for SCLEX_SREC
lappend lexers(Srec) SCLEX_SREC SCE_HEX_
set SCE_HEX_DEFAULT 0
set SCE_HEX_RECSTART 1
set SCE_HEX_RECTYPE 2
set SCE_HEX_RECTYPE_UNKNOWN 3
set SCE_HEX_BYTECOUNT 4
set SCE_HEX_BYTECOUNT_WRONG 5
set SCE_HEX_NOADDRESS 6
set SCE_HEX_DATAADDRESS 7
set SCE_HEX_RECCOUNT 8
set SCE_HEX_STARTADDRESS 9
set SCE_HEX_ADDRESSFIELD_UNKNOWN 10
set SCE_HEX_EXTENDEDADDRESS 11
set SCE_HEX_DATA_ODD 12
set SCE_HEX_DATA_EVEN 13
set SCE_HEX_DATA_UNKNOWN 14
set SCE_HEX_DATA_EMPTY 15
set SCE_HEX_CHECKSUM 16
set SCE_HEX_CHECKSUM_WRONG 17
set SCE_HEX_GARBAGE 18
# Lexical state for SCLEX_IHEX (shared with Srec)
lappend lexers(IHex) SCLEX_IHEX SCE_HEX_
# Lexical state for SCLEX_TEHEX (shared with Srec)
lappend lexers(TEHex) SCLEX_TEHEX SCE_HEX_

# Events

# evt void StyleNeeded(int position)
set SCI_STYLENEEDED 2000
set prototype(SCI_STYLENEEDED) {void {int position}}
# evt void CharAdded(int ch)
set SCI_CHARADDED 2001
set prototype(SCI_CHARADDED) {void {int ch}}
# evt void SavePointReached(void)
set SCI_SAVEPOINTREACHED 2002
set prototype(SCI_SAVEPOINTREACHED) {void void}
# evt void SavePointLeft(void)
set SCI_SAVEPOINTLEFT 2003
set prototype(SCI_SAVEPOINTLEFT) {void void}
# evt void ModifyAttemptRO(void)
set SCI_MODIFYATTEMPTRO 2004
set prototype(SCI_MODIFYATTEMPTRO) {void void}
# GTK+ Specific to work around focus and accelerator problems:
# evt void Key(int ch, int modifiers)
set SCI_KEY 2005
set prototype(SCI_KEY) {void {int ch, int modifiers}}
# evt void DoubleClick(int modifiers, int position, int line)
set SCI_DOUBLECLICK 2006
set prototype(SCI_DOUBLECLICK) {void {int modifiers, int position, int line}}
# evt void UpdateUI(int updated)
set SCI_UPDATEUI 2007
set prototype(SCI_UPDATEUI) {void {int updated}}
# evt void Modified(int position, int modificationType, string text, int length, int linesAdded, int line, int foldLevelNow, int foldLevelPrev, int token, int annotationLinesAdded)
set SCI_MODIFIED 2008
set prototype(SCI_MODIFIED) {void {int position, int modificationType, string text, int length, int linesAdded, int line, int foldLevelNow, int foldLevelPrev, int token, int annotationLinesAdded}}
# evt void MacroRecord(int message, int wParam, int lParam)
set SCI_MACRORECORD 2009
set prototype(SCI_MACRORECORD) {void {int message, int wParam, int lParam}}
# evt void MarginClick(int modifiers, int position, int margin)
set SCI_MARGINCLICK 2010
set prototype(SCI_MARGINCLICK) {void {int modifiers, int position, int margin}}
# evt void NeedShown(int position, int length)
set SCI_NEEDSHOWN 2011
set prototype(SCI_NEEDSHOWN) {void {int position, int length}}
# evt void Painted(void)
set SCI_PAINTED 2013
set prototype(SCI_PAINTED) {void void}
# evt void UserListSelection(int listType, string text, int positionint, int ch, CompletionMethods listCompletionMethod)
set SCI_USERLISTSELECTION 2014
set prototype(SCI_USERLISTSELECTION) {void {int listType, string text, int positionint, int ch, CompletionMethods listCompletionMethod}}
# evt void URIDropped(string text)
set SCI_URIDROPPED 2015
set prototype(SCI_URIDROPPED) {void {string text}}
# evt void DwellStart(int position, int x, int y)
set SCI_DWELLSTART 2016
set prototype(SCI_DWELLSTART) {void {int position, int x, int y}}
# evt void DwellEnd(int position, int x, int y)
set SCI_DWELLEND 2017
set prototype(SCI_DWELLEND) {void {int position, int x, int y}}
# evt void Zoom(void)
set SCI_ZOOM 2018
set prototype(SCI_ZOOM) {void void}
# evt void HotSpotClick(int modifiers, int position)
set SCI_HOTSPOTCLICK 2019
set prototype(SCI_HOTSPOTCLICK) {void {int modifiers, int position}}
# evt void HotSpotDoubleClick(int modifiers, int position)
set SCI_HOTSPOTDOUBLECLICK 2020
set prototype(SCI_HOTSPOTDOUBLECLICK) {void {int modifiers, int position}}
# evt void CallTipClick(int position)
set SCI_CALLTIPCLICK 2021
set prototype(SCI_CALLTIPCLICK) {void {int position}}
# evt void AutoCSelection(string text, int position, int ch, CompletionMethods listCompletionMethod)
set SCI_AUTOCSELECTION 2022
set prototype(SCI_AUTOCSELECTION) {void {string text, int position, int ch, CompletionMethods listCompletionMethod}}
# evt void IndicatorClick(int modifiers, int position)
set SCI_INDICATORCLICK 2023
set prototype(SCI_INDICATORCLICK) {void {int modifiers, int position}}
# evt void IndicatorRelease(int modifiers, int position)
set SCI_INDICATORRELEASE 2024
set prototype(SCI_INDICATORRELEASE) {void {int modifiers, int position}}
# evt void AutoCCancelled(void)
set SCI_AUTOCCANCELLED 2025
set prototype(SCI_AUTOCCANCELLED) {void void}
# evt void AutoCCharDeleted(void)
set SCI_AUTOCCHARDELETED 2026
set prototype(SCI_AUTOCCHARDELETED) {void void}
# evt void HotSpotReleaseClick(int modifiers, int position)
set SCI_HOTSPOTRELEASECLICK 2027
set prototype(SCI_HOTSPOTRELEASECLICK) {void {int modifiers, int position}}
# evt void FocusIn(void)
set SCI_FOCUSIN 2028
set prototype(SCI_FOCUSIN) {void void}
# evt void FocusOut(void)
set SCI_FOCUSOUT 2029
set prototype(SCI_FOCUSOUT) {void void}
# evt void AutoCCompleted(string text, int position, int ch, CompletionMethods listCompletionMethod)
set SCI_AUTOCCOMPLETED 2030
set prototype(SCI_AUTOCCOMPLETED) {void {string text, int position, int ch, CompletionMethods listCompletionMethod}}

# There are no provisional features currently
# Are documents larger than 2GB supported?
# get bool GetLargePositionSupport(,)
set SCI_GETLARGEPOSITIONSUPPORT 2694
set prototype(SCI_GETLARGEPOSITIONSUPPORT) {bool ,}

# Deprecated in 2.21
# The SC_CP_DBCS value can be used to indicate a DBCS mode for GTK+.
set SC_CP_DBCS 1

# Deprecated in 2.30

# In palette mode?
# get bool GetUsePalette(,)
set SCI_GETUSEPALETTE 2139
set prototype(SCI_GETUSEPALETTE) {bool ,}

# In palette mode, Scintilla uses the environment's palette calls to display
# more colours. This may lead to ugly displays.
# set void SetUsePalette(bool usePalette,)
set SCI_SETUSEPALETTE 2039
set prototype(SCI_SETUSEPALETTE) {void {bool usePalette,}}

# Deprecated in 3.5.5

# Always interpret keyboard input as Unicode
# set void SetKeysUnicode(bool keysUnicode,)
set SCI_SETKEYSUNICODE 2521
set prototype(SCI_SETKEYSUNICODE) {void {bool keysUnicode,}}

# Are keys always interpreted as Unicode?
# get bool GetKeysUnicode(,)
set SCI_GETKEYSUNICODE 2522
set prototype(SCI_GETKEYSUNICODE) {bool ,}
}
