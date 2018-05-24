export latex

function latex(formula)
    if !(formula isa Observable)
        formula = Observable(formula)
    end
    s = "lll"
    tex = vue(dom"div.katex#lll"("{{formula}}"), ["formula" => formula])
    import!(tex, ["/pkg/InteractBase/katex.min.js",
                  "/pkg/InteractBase/katex.min.css"])
    onimport(tex, js"""
    function (katex) {
        return katex.render($(formula[]), document.getElementById(lll));
    }
    """)
    onjs(formula, js"""
    function (str) {
        return katex.render(str, document.getElementById(lll));
        }
    """
    )
    tex
end
