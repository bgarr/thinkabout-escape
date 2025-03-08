@builtin "string.ne"
@preprocessor module

@{%
import moo from "moo";

const lexer = moo.compile({
  solution:  /solution/,
  ws:     /[ \t]+/,
});
%}

# Pass your lexer object using the @lexer option:
@lexer lexer

solutionLine        -> solution %ws dqstring newline
solution            -> %solution
newline             -> "\r" "\n" | "\r" | "\n"  {% d => "" %}