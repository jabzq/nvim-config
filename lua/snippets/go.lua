local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node

return {
  -- Handler de API padrão (net/http ou Gin)
  s("hdl", {
    t({ "func " }), i(1, "HandlerName"), t({ "(w http.ResponseWriter, r *http.Request) {", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  -- Verificação clássica de erro de backend
  s("iferr", {
    t({ "if err != nil {", "\treturn " }),
    i(1, "err"),
    t({ "", "}" }),
  }),

  -- JSON tag para Structs
  s("jt", {
    t({ "`json:\"" }), i(1, "field_name"), t({ "\"`" }),
  }),

  -- Definição de Middleware
  s("mw", {
    t({ "func " }), i(1, "Middleware"), t({ "(next http.Handler) http.Handler {", "" }),
    t({ "\treturn http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {", "\t\t" }),
    i(0),
    t({ "", "\t\tnext.ServeHTTP(w, r)", "\t})", "}" }),
  }),

  -- Context with Timeout (essencial para DB e chamadas externas)
  s("ctxout", {
    t({ "ctx, cancel := context.WithTimeout(context.Background(), " }),
    i(1, "5"), t({ " * time.Second)", "" }),
    t({ "defer cancel()", "" }),
    i(0),
  }),

  -- Criar uma Struct para um Model/Entidade
  s("modl", {
    t({ "type " }), i(1, "Model"), t({ " struct {", "" }),
    t({ "\tID        uint64    `json:\"id\"`" }),
    t({ "", "\tCreatedAt time.Time `json:\"created_at\"`" }),
    t({ "", "\t" }), i(0),
    t({ "", "}" }),
  }),

  -- Iniciar um servidor HTTP básico
  s("srv", {
    t({ "srv := &http.Server{", "" }),
    t({ "\tAddr:         \":" }), i(1, "8080"), t({ "\",", "" }),
    t({ "\tHandler:      " }), i(2, "router"), t({ ",", "" }),
    t({ "\tReadTimeout:  5 * time.Second,", "" }),
    t({ "\tWriteTimeout: 10 * time.Second,", "" }),
    t({ "}", "", "log.Fatal(srv.ListenAndServe())" }),
  }),
}
