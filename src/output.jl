export latex

# function latex(formula)
#     if !(formula isa Observable)
#         formula = Observable(formula)
#     end
#     s = "lll"
#     tex = vue(dom"div.katex#lll"("{{formula}}"), ["formula" => formula])
#     import!(tex, ["/pkg/InteractBase/katex.min.js",
#                   "/pkg/InteractBase/katex.min.css"])
#     onimport(tex, js"""
#     function (katex) {
#         return katex.render($(formula[]), document.getElementById(lll));
#     }
#     """)
#     onjs(formula, js"""
#     function (str) {
#         return katex.render(str, document.getElementById(lll));
#         }
#     """
#     )
#     tex
# end

function latex(formula)
    if !(formula isa Observable)
        formula = Observable(formula)
    end
    tex = vue(dom"div.katex#lll"("{{formula}}"), ["formula" => formula])
    import!(tex, ["https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.9.0/katex.min.js",
                  "https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.9.0/katex.min.css"])
    # import!(tex, "https://cdn.jsdelivr.net/npm/katex@0.10.0-alpha/dist/contrib/auto-render.min.js")
    onimport(tex, js"""
        function (katex) {
            return katex.render($(formula[]), document.getElementById(lll));
        }
        """)

    # onimport(tex, js"""
    #     function (event) {
    #         return katex.render($(formula[]), document.getElementById(lll));
    #     }
    #     """)
    #
    # onjs(formula, js"""
    # function (str) {
    #     return katex.render(str, document.getElementById(lll));
    #     }
    # """
    # )
    tex
end
