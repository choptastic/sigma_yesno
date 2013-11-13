-module (element_yesno).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

-export([reflect/0,
		render_element/1]).

reflect() -> record_info(fields, yesno).

is_true(false) -> false;
is_true(no) -> false;
is_true(0) -> false;
is_true("false") -> false;
is_true("no") -> false;
is_true("0") -> false;
is_true("") -> false;
is_true(_) -> true.


render_element(R = #yesno{}) ->
	IsTrue = is_true(R#yesno.value),

	#dropdown{
		id=R#yesno.id,
		class=[R#yesno.class,yesno],
		postback=R#yesno.postback,
		delegate=R#yesno.delegate,
		options=[
			#option{text=R#yesno.no_text,value="0",selected=not(IsTrue)},
			#option{text=R#yesno.yes_text,value="1",selected=IsTrue}
		]
	}.
