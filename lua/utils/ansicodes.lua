M.ansi_codes = {
    _clear = "[0m",
    _red = "[0;31m",
    _green = "[0;32m",
    _yellow = "[0;33m",
    _blue = "[0;34m",
    _magenta = "[0;35m",
    _cyan = "[0;36m",
    _grey = "[0;90m",
    _dark_grey = "[0;97m",
    _white = "[0;98m",
    red = function(self, string)
        return self._red .. string .. self._clear
    end,
    green = function(self, string)
        return self._green .. string .. self._clear
    end,
    yellow = function(self, string)
        return self._yellow .. string .. self._clear
    end,
    blue = function(self, string)
        return self._blue .. string .. self._clear
    end,
    magent = function(self, string)
        return self._magenta .. string .. self._clear
    end,
    cyan = function(self, string)
        return self._cyan .. string .. self._clear
    end,
    grey = function(self, string)
        return self._grey .. string .. self._clear
    end,
    dark_grey = function(self, string)
        return self._dark_grey .. string .. self._clear
    end,
    white = function(self, string)
        return self._white .. string .. self._clear
    end
}
