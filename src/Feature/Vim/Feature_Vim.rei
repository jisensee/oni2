open EditorCoreTypes;
// MODEL

type model;

let initial: model;

let mode: model => Vim.Mode.t;

let recordingMacro: model => option(char);

// MSG

[@deriving show]
type msg =
  | ModeChanged([@opaque] Vim.Mode.t)
  | PasteCompleted({cursors: [@opaque] list(BytePosition.t)})
  | Pasted(string)
  | SettingChanged(Vim.Setting.t)
  | MacroRecordingStarted({register: char})
  | MacroRecordingStopped;

type outmsg =
  | Nothing
  | Effect(Isolinear.Effect.t(msg))
  | CursorsUpdated(list(BytePosition.t));

// UPDATE

let update: (msg, model) => (model, outmsg);

module CommandLine: {let getCompletionMeet: string => option(int);};

// CONFIGURATION

module Configuration: {
  type resolver = string => option(Vim.Setting.value);

  let resolver: model => resolver;
};
