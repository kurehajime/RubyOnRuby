require "minruby"

def evaluate(tree,env)
    case tree[0]
    when "if"
        if evaluate(tree[1],env)
            evaluate(tree[2],env)
        elsif tree[3]
            evaluate(tree[3],env)
        end
    when "while"
        while evaluate(tree[1],env) do
            evaluate(tree[2],env)
        end
    when "while2"
        evaluate(tree[2],env)
        while evaluate(tree[1],env) do
            evaluate(tree[2],env)
        end
    when "lit"
        tree[1]
    when "and"
        evaluate(tree[1],env) and evaluate(tree[2],env)
    when "or"
        evaluate(tree[1],env) or evaluate(tree[2],env)
    when "+"
        evaluate(tree[1],env) + evaluate(tree[2],env)
    when "-"
        evaluate(tree[1],env) - evaluate(tree[2],env)
    when "*"
        evaluate(tree[1],env) * evaluate(tree[2],env)
    when "/"
        evaluate(tree[1],env) / evaluate(tree[2],env)
    when "%"
        evaluate(tree[1],env) % evaluate(tree[2],env)
    when "**"
        evaluate(tree[1],env) ** evaluate(tree[2],env)
    when "=="
        evaluate(tree[1],env) == evaluate(tree[2],env)
    when "!="
        evaluate(tree[1],env) != evaluate(tree[2],env)
    when ">"
        evaluate(tree[1],env) > evaluate(tree[2],env)
    when "<"
        evaluate(tree[1],env) < evaluate(tree[2],env)
    when "<="
        evaluate(tree[1],env) <= evaluate(tree[2],env)
    when ">="
        evaluate(tree[1],env) <= evaluate(tree[2],env)
    when "func_call"
        p(evaluate(tree[2],env))
    when "stmts"
        i = 1
        last = nil
        while tree[i] != nil
            last = evaluate(tree[i],env)
            i = i + 1
        end
        last
    when "var_assign"
        env[tree[1]] = evaluate(tree[2],env)
    when "var_ref"
        env[tree[1]]
    end
end
str = minruby_load()
tree = minruby_parse(str)
# pp tree
env = {}
answer = evaluate(tree,env)