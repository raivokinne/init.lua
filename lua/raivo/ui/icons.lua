---@class ui.icons
local M = {
    TUI = {
        Ellipsis = '…',
        CollapsedGroup = '',
        ExpandedGroup = '',
        LineContinuation = '↳',
        LineEnd = '⏎',
        VisibleSpace = '·',
        VisibleTab = '▶',
        MissingLine = '╱',
        IndentLevel = '│',
        PromptPrefix = '',
        SelectionPrefix = '',
        StrongPrefix = '▸',
        StrongSuffix = '◂',
        ListSeparator = '◦',
        ScrollLine = '▒',
        ScrollView = '█',
    },
    Diagnostics = {
        Prefix = '●',
        LSP = {
            Error = '',
            Warn = '',
            Hint = '',
            Info = '',
        },
        DAP = {
            Stopped = '󰁕',
            Breakpoint = '',
            BreakpointCondition = '',
            BreakpointRejected = '',
            LogPoint = '.>',
        },
    },
    Symbols = {
        Array = '󰅪',
        Boolean = '⊨',
        Class = '󰌗',
        Color = '',
        Constant = '',
        Constructor = '',
        Copilot = '',
        Enum = '',
        EnumMember = '',
        Event = '',
        Field = '',
        File = '',
        Folder = '',
        Function = '',
        Interface = '',
        Key = '󰌆',
        Keyword = '',
        Method = '',
        Module = '',
        Namespace = '',
        Null = 'NULL',
        Number = '',
        Object = '',
        Operator = '',
        Package = '',
        Property = '',
        Reference = '',
        Snippet = '',
        String = '󰀬',
        Struct = '',
        Text = '',
        TypeParameter = '',
        Unit = '',
        Value = '',
        Variable = '',
        ColumnSeparator = '│',
    },
    Git = {
        Added = '',
        Modified = '',
        Removed = '',
        Branch = '',
        Conflict = '',
        Ignored = '◌',
        Renamed = '➜',
        Staged = '✓',
        Unstaged = '✗',
        Untracked = '★',
        Signs = {
            Add = '▐',
            Change = '▐',
            Delete = '▐',
            TopDelete = '▐',
            ChangeDelete = '▐',
            Untracked = '▐',
        },
    },
    Dependencies = {
        Installed = '✓',
        Uninstalled = '✗',
        Pending = '⟳',
    },
    Files = {
        Normal = '󰈙',
        Multiple = ' ',
        Modified = '',
        ClosedFolder = '',
        EmptyFolder = '',
        OpenFolder = '',
        Previous = '',
    },
    UI = {
        LSP = '',
        Format = '󰉿',
        Lint = '',
        Git = '󰊢',
        Debugger = '',
        ConsoleLog = '',
        Test = '󱐦',
        UI = '󰏖',
        Help = '󰋖',
        Buffers = '󱂬',
        Search = '',
        Fix = '󰁨',
        Next = '󰼧',
        Prev = '󰒮',
        Jump = '󱔕',
        Sleep = '󰒲 ',
        Quit = ' ',
        Explorer = ' ',
        Speed = '⚡',
        Clock = '',
        Replace = '󰛔',
        Disabled = '✗',
        AI = '󱐏 ',
        Notes = '󰠮',
        IgnoreHidden = '󰛑',
        ShowHidden = '󰛐',
        SyntaxTree = '󱘎',
        TMux = '',
        Switch = '',
        Action = '󰜎',
        Nuke = '󰔒',
        SpellCheck = '󰓆',
        TypoCheck = '',
        Save = '󰆓',
        SaveAll = '󰆔',
        Close = '',
        CloseAll = '',
        SessionSave = '󰆓',
        SessionRestore = '󰆔',
        SessionDelete = '󰆴',
        Toggle = '',
        CodeLens = '󰧶',
        Macro = '󱛟',
        Checkmark = '✓',
    },
    Progress = {
        '⣾',
        '⣽',
        '⣻',
        '⢿',
        '⡿',
        '⣟',
        '⣯',
        '⣷',
    },
}

return M
