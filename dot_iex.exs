defmodule Util do
  def atom_status do
    limit = :erlang.system_info(:atom_limit)
    count = :erlang.system_info(:atom_count)

    IO.puts("Currently using #{count} / #{limit} atoms")
  end

  def raw(any, label \\ "iex") do
    IO.inspect(any,
      label: label,
      pretty: true,
      limit: :infinity,
      structs: false,
      syntax_colors: [
        number: :yellow,
        atom: :cyan,
        string: :green,
        nil: :magenta,
        boolean: :magenta
      ],
      width: 0
    )
  end
end

defmodule :_exit do
  defdelegate exit(), to: System, as: :halt
  defdelegate q(), to: System, as: :halt
end

defmodule :_restart do
  defdelegate restart(), to: System, as: :restart
end

defmodule :_util do
  defdelegate raw(any), to: Util, as: :raw
end

import :_exit
import :_restart
import :_util
