require "minruby"

def evaluate(tree,genv,lenv)
    case tree[0]
    when "if"
        if evaluate(tree[1],genv,lenv)
            evaluate(tree[2],genv,lenv)
        elsif tree[3]
            evaluate(tree[3],genv,lenv)
        end
    when "while"
        while evaluate(tree[1],genv,lenv) do
            evaluate(tree[2],genv,lenv)
        end
    when "while2"
        evaluate(tree[2],genv,lenv)
        while evaluate(tree[1],genv,lenv) do
            evaluate(tree[2],genv,lenv)
        end
    when "lit"
        tree[1]
    when "and"
        evaluate(tree[1],genv,lenv) and evaluate(tree[2],genv,lenv)
    when "or"
        evaluate(tree[1],genv,lenv) or evaluate(tree[2],genv,lenv)
    when "+"
        evaluate(tree[1],genv,lenv) + evaluate(tree[2],genv,lenv)
    when "-"
        evaluate(tree[1],genv,lenv) - evaluate(tree[2],genv,lenv)
    when "*"
        evaluate(tree[1],genv,lenv) * evaluate(tree[2],genv,lenv)
    when "/"
        evaluate(tree[1],genv,lenv) / evaluate(tree[2],genv,lenv)
    when "%"
        evaluate(tree[1],genv,lenv) % evaluate(tree[2],genv,lenv)
    when "**"
        evaluate(tree[1],genv,lenv) ** evaluate(tree[2],genv,lenv)
    when "=="
        evaluate(tree[1],genv,lenv) == evaluate(tree[2],genv,lenv)
    when "!="
        evaluate(tree[1],genv,lenv) != evaluate(tree[2],genv,lenv)
    when ">"
        evaluate(tree[1],genv,lenv) > evaluate(tree[2],genv,lenv)
    when "<"
        evaluate(tree[1],genv,lenv) < evaluate(tree[2],genv,lenv)
    when "<="
        evaluate(tree[1],genv,lenv) <= evaluate(tree[2],genv,lenv)
    when ">="
        evaluate(tree[1],genv,lenv) <= evaluate(tree[2],genv,lenv)
    when "func_call"
        args = []
        i = 0
        while tree[i + 2]
            args[i] = evaluate(tree[i + 2], genv, lenv)
            i = i + 1
        end
        mhd = genv[tree[1]]
        if mhd[0] = "built_in" 
            minruby_call(mhd[1], args)
        else
        end
    when "stmts"
        i = 1
        last = nil
        while tree[i] != nil
            last = evaluate(tree[i],genv,lenv)
            i = i + 1
        end
        last
    when "var_assign"
        lenv[tree[1]] = evaluate(tree[2],genv,lenv)
    when "var_ref"
        lenv[tree[1]]
    end
end



str = minruby_load()
tree = minruby_parse(str)
# pp tree
genv = {"p" => ["built_in","p"]}
lenv = {}
answer = evaluate(tree,genv,lenv)