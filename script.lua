--mkdir
function createDirectory(path)
    local command = string.format("mkdir %s", path)
    os.execute(command)
    print("Directory created: " .. path)
end

--exists
function exists(file)
    local ok, err, code = os.rename(file, file)
    if not ok then
       if code == 13 then

          return true
       end
    end
    return ok, err
 end
--isdir
 function isdir(path)
    local path2 = path
    return exists(path2 .. "/")
 end
--file exists
 function file_exists(name)
    local f=io.open(name,"r")
    if f~=nil then io.close(f) return true else return false end
 end

dungeon1 = {{0, 0, 0, 48}, {1, 0, 0, 48}, {0, 1, 0, 48}, {1, 1, 0, 48}, {0, 0, 1, 48}, {1, 0, 1, 48},{0, 1, 1, 48}, {1, 1, 1, 47}, {2, 0, 0, 48}, {2, 0, 1, 48}, {2, 1, 0, 48}, {2, 1, 1, 49}, {2, 1, 2, 48}, 
{2, 2, 1, 48}, {2, 2, 2, 48}}

dungeon2 = {{0, 0, 1, 48}, {1, 0, 0, 48}, {0, 1, 0, 48}, {1, 1, 3, 48}, {0, 0, 1, 48}, {1, 0, 1, 48},{0, 1, 1, 48}, {1, 1, 1, 47}, {2, 0, 0, 48}, {2, 0, 1, 48}, {2, 1, 0, 48}, {2, 1, 1, 49}, {2, 1, 2, 49}, 
{2, 2, 1, 48}, {2, 2, 4, 48}}

dungeon3 = {{0, 0, 1, 48}, {1, 0, 0, 48}, {0, 1, 0, 48}, {1, 1, 3, 48}, {0, 0, 1, 48}, {1, 0, 1, 48},{0, 1, 1, 48}, {1, 1, 1, 47}, {2, 0, 0, 48}, {1, 0, 1, 48}, {2, 1, 2, 48}, {2, 1, 1, 49}, {2, 4, 2, 49}, 
{1, 2, 1, 48}, {3, 2, 3, 48}}

dungeon4 = {{3, 0, 1, 48}, {1, 0, 0, 48}, {0, 1, 0, 19}, {1, 1, 3, 48}, {0, 0, 1, 48}, {1, 0, 1, 48},{0, 1, 1, 48}, {1, 1, 1, 47}, {2, 0, 0, 48}, {1, 0, 1, 48}, {2, 1, 2, 48}, {2, 1, 1, 49}, {2, 4, 2, 49}, 
{1, 2, 1, 48}, {3, 2, 3, 48}, {3, 3, 3, 48}, {5, 2, 3, 48}, {3, 2, 4, 13}}

--function moddata(path)
--    local folder = file_exists(path + "/isGenRuins.txt")

--    if folder then
--        print ("TRUE")
--    else
--        lfs.mkdir(path)
--    end
--end

save = file_exists("save.ccc")
if file_exists then
    print ("save.ccc founded!")
else
    print("please save world and restart game")
end

function notFound()
    print("please save world and restart game")
end

function onStart()
    if save then
        is_moddata = isdir("moddata/mystruins")
        if is_moddata then
            print("OK1")
        else
            createDirectory("moddata\\mystruins")
        end

        file = file_exists('moddata/mystruins/isGenRuins.txt')
        if file then
            print("OK")
        else
            filek = io.open("moddata/mystruins/isGenRuins.txt", "w")
            filek:write("1")
            filek:close()

            for b=1, 15 do
                x = math.random(1, 256)
                z = math.random(1, 256)
                y = math.random(25, 35)
                
                structure = math.random(1, 4)
                if structure == 1 then
                    dungeon = dungeon1
                end
                if structure == 2 then
                    dungeon = dungeon2
                end
                if structure == 3 then
                    dungeon = dungeon3
                end
                if structure == 4 then
                    dungeon = dungeon4
                end

                for i=1,#dungeon do
                    World.setBlk(dungeon[i][1] + x, dungeon[i][2] + y, dungeon[i][3] + z, dungeon[i][4])
                end
            end
        end
    else
        notFound()
    end
end