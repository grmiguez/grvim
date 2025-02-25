local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node

-- Función para obtener las líneas seleccionadas en Visual Mode
local function get_selected_lines()
    local start_pos, end_pos = vim.fn.getpos("'<"), vim.fn.getpos("'>")
    local start_line, end_line = start_pos[2], end_pos[2]
    local lines = vim.fn.getline(start_line, end_line)
    return lines
end

-- Snippet para generar getters con formato espaciado y tabulado
ls.add_snippets("php", {
    s("getter", {
        f(function(_, _)
            -- Obtener las líneas seleccionadas
            local lines = get_selected_lines()

            -- Crear una tabla para almacenar los getters
            local getters = {}

            -- Procesar cada línea seleccionada
            for _, line in ipairs(lines) do
                -- Regex para capturar tipo y nombre de la variable, considerando nullable
                local _, _, var_type, var_name = string.find(line, "%s*(%??%w+)%s+%$(%w+);")

                if var_type and var_name then
                    -- Generar el getter para esta variable con formato espaciado
                    table.insert(getters, "public function " .. var_name .. "(): " .. var_type)
                    table.insert(getters, "{")
                    table.insert(getters, "    return $this->" .. var_name .. ";")
                    table.insert(getters, "}")
                    table.insert(getters, "") -- Línea vacía entre getters
                end
            end

            -- Si no se encontró ninguna declaración válida
            if #getters == 0 then
                return { "-- No se encontraron declaraciones válidas." }
            end

            -- Eliminar la última línea vacía
            table.remove(getters)

            return getters
        end, {}),
    }),
})
