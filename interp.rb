require "minruby"

def evaluate(tree)
    if tree[0] == "lit"
        tree[1]
    else
        left = evaluate tree[1]
        right = evaluate tree[2]
        case tree[0]
        when "+"
            left + right
        when "-"
            left - right
        when "*"
            left * right
        when "/"
            left / right
        when "%"
            left % right
        when "**"
            left ** right
        end
    end
end


tree = minruby_parse("(1 + 2) / 3 * 4 * (56 / 7 + 8 + 9)")
answer = evaluate(tree)
p answer

