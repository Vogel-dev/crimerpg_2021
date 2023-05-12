--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

-- Settings
DBHandler=nil
DBName="db_60758"
DBUser="db_60758"
DBPass="GoAYp0dLqFv5"
DBHost="87.98.236.134"

-- Functions
function dbSet(...)
	if not {...} then return end
	local query=dbExec(DBHandler, ...)
	return query
end

function dbGet(...)
	if not {...} then return end
	local query=dbQuery(DBHandler, ...)
	local result=dbPoll(query, -1)
	return result
end


addEventHandler("onResourceStart", resourceRoot, function()
	DBHandler=dbConnect("mysql", "dbname="..DBName..";host="..DBHost.."", DBUser, DBPass, "share=1")
	if DBHandler then
		outputDebugString("DATABASE > Połączenie zostało nawiązane.")
	else
		outputDebugString("DATABASE > Połączenie nie zostało nawiązane.")
	end
end)


local SQL_LOGIN="db_60758"
local SQL_PASSWD="GoAYp0dLqFv5"
local SQL_DB="db_60758"
local SQL_HOST="87.98.236.134"
local SQL_PORT=3306

local root = getRootElement()

local SQL

local function connect()
	SQL = mysql_connect(SQL_HOST, SQL_LOGIN, SQL_PASSWD, SQL_DB, SQL_PORT)
	if (not SQL) then
		outputServerLog("DATABASE > Połączenie nie zostało nawiązane.")
	else
	end

end


local function keepAlive()
	if (not mysql_ping(SQL)) then
		outputServerLog("DATABASE > Połączenie nie zostało nawiązane.")
		connect()
	end
end
addEventHandler("onResourceStart",getResourceRootElement(),function()
	connect()
	setTimer(keepAlive, 30000, 0)
end)

function esc(value)
	return mysql_escape_string(SQL,value)
end

function pobierzTabeleWynikow(query)
	local result=mysql_query(SQL,query)
	if (not result) then 
		outputDebugString("DATABASE > mysql_query failed: (" .. mysql_errno(SQL) .. ") " .. mysql_error(SQL))
		outputServerLog("DATABASE > mysql_query failed: (" .. mysql_errno(SQL) .. ") " .. mysql_error(SQL))
		return nil 
	end
	local tabela={}
	for result,row in mysql_rows_assoc(result) do
		table.insert(tabela,row)
	end
	mysql_free_result(result)
	return tabela
end

function pobierzWyniki(query)
	local result=mysql_query(SQL,query)
	if (not result) then return nil end
	row = mysql_fetch_assoc(result)
	mysql_free_result(result)
	return row
end


function zapytanie(query)
	local result=mysql_query(SQL,query)
	if (result) then mysql_free_result(result) return true end
	return
end

function insertID()
	return mysql_insert_id(SQL)
end

function affectedRows()
	return mysql_affected_rows(SQL)
end


function fetchRows(query)
	local result=mysql_query(SQL,query)
	if (not result) then return nil end
	local tabela={}

	while true do
    	local row = mysql_fetch_row(result)
	    if (not row) then break end
	    table.insert(tabela,row)
	end
	mysql_free_result(result)
	return tabela
end


function getSQLLink()
	return SQL
end

function this ( theResource ) 
	local they = getResourceFromName ( "crime_database" ) 
if getResourceFromName then 
	restartResource(they) 
	end 
end 
setTimer(this, 1000*180,0) 