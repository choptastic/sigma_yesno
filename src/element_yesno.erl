-module (element_yesno).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

-export([
		reflect/0,
		transform_element/1
	]).

-spec reflect() -> [atom()].
reflect() -> record_info(fields, yesno).

-spec is_true(any()) -> boolean().
is_true(false) -> false;
is_true(no) -> false;
is_true(0) -> false;
is_true("false") -> false;
is_true("no") -> false;
is_true("0") -> false;
is_true("") -> false;
is_true(_) -> true.

-spec transform_element(#yesno{}) -> #dropdown{}.
transform_element(R = #yesno{}) ->
	IsTrue = is_true(R#yesno.value),

	DD = wf_utils:copy_fields(R, #dropdown{}),
	DD#dropdown{
		options=[
			#option{text=R#yesno.no_text,value="0",selected=not(IsTrue)},
			#option{text=R#yesno.yes_text,value="1",selected=IsTrue}
		]
	}.
