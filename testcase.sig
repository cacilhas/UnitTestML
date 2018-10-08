signature TEST_CASE =
sig
  val run      : unit -> unit
  val describe : string -> (unit -> unit) -> unit
  val it       : string -> (unit -> unit) -> unit
end
