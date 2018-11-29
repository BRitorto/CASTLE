//credit to jefa lel

typedef enum token {

		while_, do_, lparen_, rparen_, lbrack_, rbrack_, if_, else_, 
		endline_, equals_, or_, and_, not_, equalscmp_, diff_, lthan_,
		 lethan_, gthan_, gethan_, plus_, minus_, mult_, div_, string_t_,  
		 int_t_, new_,  print_,  true_, false_, id_, int_, string_,

    //dummy
    root_,

    // Non terminals
    file_, statement_, definition_, assignment_,  type_, expression_, 
    conjunction_, equality_, equop_, relation_, relop_, addition_,   
    addop_, term_, mulop_, factor_, unaryop_, primary_, fuint_, 
    fustring_, reint_, restring_, operand_, boperator,

} token;

static char * tokens[255] = {"while", "do", "(", ")", "{\n", "}\n", "if", "else", ";\n", "=", "||", "&&", "!", ".equals(", "!", "<", "<=", ">", ">=", "+", "-", "*", "/", "String ", "Integer ", "new ", "syso", "(new Integer(1).equals(1)) ", "(new Integer(1).equals(0))"};

typedef struct Node_t{
	struct Node_t ** children;
	char * value;
	int index;
	token token;
} Node;

Node *
new_tree();

void
add_terminal_node(Node * p, token token);

void
set_info(Node * n);

char *
get_info(Node * n);
void
add_node(Node * p, Node * c);

void
print_tree(Node * t);

void
add_terminal_node_with_value(Node * p, token token, char * value);

void
print_headers();

void
print_program();

void
print_end();
