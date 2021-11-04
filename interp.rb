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
        when "=="
            left == right
        when "!="
            left != right
        when ">"
            left > right
        when "<"
            left < right
        when "<="
            left <= right
        when ">="
            left <= right
        end
    end
end
def max(tree)
    if tree[0] == "lit"
        tree[1]
    else
        left = max tree[1]
        right = max tree[2]
        if left >= right
            left
        else
            right
        end
    end
end

tree = minruby_parse("1 + 4 + 3")
answer = evaluate(tree)
p answer

