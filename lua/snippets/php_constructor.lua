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

-- Snippet para generar el constructor con formato espaciado y tabulado
ls.add_snippets("php", {
    s("construct", {
        f(function(_, _)
            -- Obtener las líneas seleccionadas
            local lines = get_selected_lines()

            -- Crear una tabla para almacenar los parámetros del constructor
            local params = {}
            local assignments = {}

            -- Procesar cada línea seleccionada
            for _, line in ipairs(lines) do
                -- Regex para capturar tipo y nombre de la variable, considerando nullable
                local _, _, var_type, var_name = string.find(line, "%s*(%??%w+)%s+%$(%w+);")

                if var_type and var_name then
                    -- Agregar parámetro al constructor
                    table.insert(params, var_type .. " $" .. var_name)
                    -- Agregar asignación del parámetro a la propiedad
                    table.insert(assignments, "$this->" .. var_name .. " = $" .. var_name .. ";")
                end
            end

            -- Si no se encontró ninguna declaración válida
            if #params == 0 then
                return { "-- No se encontraron declaraciones válidas." }
            end

            -- Construir el constructor
            local constructor = {
                "    public function __construct(",
            }

            -- Concatenar los parámetros, asegurándonos de no agregar una coma al final del último
            for i, param in ipairs(params) do
                if i < #params then
                    table.insert(constructor, param .. ",")
                else
                    table.insert(constructor, param)  -- No coma en el último parámetro
                end
            end

            -- Cerrar la apertura del constructor
            table.insert(constructor, "    ) {")  -- Apertura del cuerpo del constructor

            -- Añadir las asignaciones dentro del constructor
            for _, assignment in ipairs(assignments) do
                table.insert(constructor, "        " .. assignment)
            end

            -- Cerrar el constructor
            table.insert(constructor, "    }")

            -- Imprimir el constructor antes de devolverlo
            print(table.concat(constructor, "\n"))

            return constructor
        end, {}),
    }),
})
