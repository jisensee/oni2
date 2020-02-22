type t =
  pri {
    anchor: int,
    focus: int
};

type selectionVariant =
  | Left(string, int)
  | Right(string, int)
  | Start
  | End(string)
  | Position(string, int);

let initial: t;
let create: (string, ~anchor:int, ~focus:int) => t;

let isCollapsed: t => bool;
let collapse: (t, selectionVariant) => t;
let extend: (t, selectionVariant) => t;