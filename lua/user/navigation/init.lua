-- ::::::::::::::::::::::::::::::::::::::::::::::::::::
-- ::::  navigation-related packages and settings  ::::
-- ::::::::::::::::::::::::::::::::::::::::::::::::::::

-- easier import paths...
local nav = 'user.navigation.'

require(nav .. 'telescope') -- fuzzy finder
require(nav .. 'bufjump')   -- previous/next buffer
require(nav .. 'harpoon')   -- shortlist of important files
require(nav .. 'neo_tree')  -- file tree navigation
require(nav .. 'project')   -- project root detection / change dir


