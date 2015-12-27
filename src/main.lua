--
-- Created by IntelliJ IDEA.
-- User: Akon-Home
-- Date: 15/12/26
-- Time: 下午8:04
-- To change this template use File | Settings | File Templates.
--
print("hello lua 哈啊哈哈")
--[[
function fact(n)
    if n==0 then
        return 1
    else
        return n*fact(n-1)
    end
end

print("enter a number:")
a = io.read("*number") --read a number
print(fact(a))
--]]

g_a = 1111

local b
local c=12345
local d=12.345
local e="12345"

print(g_a,b,c,d,e)

local function value()
    local a={"22","33" }
    local b="哈哈哈哈哈"
    print(a,b,c,d,e)
end

value()
print(g_a,b,c,d,e)

local index = 3
local a = {1,2,3,4,5 }

index,a[index] = index+1, 20

print(index, a[3])

local x = 10
local y = 20
local z = 30

x,y,z = y,z,x

print(x,y,z)

local function test_while(count)

    local sum =0
    local index = 0
    while index < count do
        sum = sum + index
        index = index + 1
        if sum > 1000 then
            break
        end
    end
    print(index, sum)
end

test_while(100)

local function test_if(age,sex)
    if age == 40 and sex == "Male" then
        print("男人40一枝花")
    elseif age > 60 and sex ~= "Female" then
        print("old man without country!")
    elseif age < 20 then
        io.write("too young, too naive!")
    else
        print("input your age:")
        local age = io.read()
        print("Your age is "..age)
    end
end

test_if(40, "Male")

local function test_for()
    local sum = 0
    for i = 1, 100 do
        sum = sum+i
    end
    print("sum:1-100 = "..sum)

    sum = 0
    for i = 1, 100, 2 do
        sum = sum +i
    end
    print("sum:1-100,2 = "..sum)

    sum = 0
    for i = 100,1,-2 do
        sum = sum + i
    end
    print("sum:100-1,-2 = ", sum)

end

test_for()
print("for i = ",i)

local function test_util(max)
    local sum = 2
    repeat
        sum = sum ^2
        print(sum)
        if sum > 100 then
            break
        end
    until sum > max

    print("sum = "..sum)
end

test_util(1000)

local function newCounter()
    local i = 0
    return function()
        i = i + 1
        return i
    end
end

local function myPower(x)
    return function(y)
        return y^x
    end
end

local function test_funtion()
    local c1 = newCounter()
    print(c1())
    print(c1())
    print(c1())

    local power2 = myPower(2)
    local power3 = myPower(3)

    print(power2(4)) -- 4^2
    print(power3(4)) -- 4^3
end

test_funtion()

local function getUserInfo(id)
    print("id = ", id)
    return "haoel", 37, "haoel@hotmail.com", "http://jb51.net"
end

local function test_return()
    local name, age, email, website, bGay = getUserInfo()
    print(name, age, email, website, bGay)
end

test_return()

local function printTable(t)
    for k,v in pairs(t) do
        print(k,"=",v)
    end
end

local function test_table()
    -- key:value
    local haole = {name="jaskon", age="24", handSome=true, [3.14]="PI", [250]="Foo"}
    print(haole.name, haole.age, haole.handSome)
    haole.website = "www.haole.com"
    haole.handSome = false
    print(haole.name, haole.website, haole.handSome)

    print(haole["name"], haole["website"], haole.handSome, haole[3.14], haole[250])
    -- array
    local array = { 1,2,3,4,5 }
    for i = 1, 5 do
        print(array[i])
    end
    array[3] = nil
    print("#array=",#array)
    printTable(array)
    local array2 = {3321, 1, 1.2, "test", nil, function() print("xxxx") end, haole }
    print("#array2=",#array2)
    for i = 1,#array2 do
        print(type(array2[i]))
        print(array2[i])
        if type(array2[i]) == "function" then
            array2[i]()
        end
    end
    printTable(array2)
end

test_table()

local function test_meta()
    local fraction_a = {a=2,b=3} --a/b 分数
    local fraction_b = {a=4,b=7}
    -- 2/3 + 4/7
    local fraction_op = {}
    --[[ metaMethod
        __add(a,b) --> a+b
        __sub(a,b) --> a-b
        __mul(a,b) --> a*b
        __div(a,b) --> a/b
        __mod(a,b) --> a%b
        __pow(a,b) --> a^b
        __unm(a)   --> -a
        __concat(a,b) --> a..b
        __len(a)   -->#a
        __eq(a,b) --> a==b
        __lt(a,b) --> a<b
        __le(a,b) --> a<=b
        __index(a,b) --> a.b
        __newindex(a,b,c) --> a.b = c
        __call(a,...) -->a(...)
    --]]
    function fraction_op.__add(f1, f2)
        local ret = {}
        ret.a = f1.a*f2.b + f2.a*f1.b
        ret.b = f1.b*f2.b
        return ret
    end
    setmetatable(fraction_a, fraction_op)
    setmetatable(fraction_b, fraction_op)
    local fraction_s = fraction_a + fraction_b
    printTable(fraction_s)
end

test_meta()

local function test_oo()
    local Person = {}
    function Person:new(p)
        local obj = p
        if obj == nil then
            obj = {name="zoukn",age=37,handome=true}
        end
        self.__index = self
        return setmetatable(obj,self)
    end
    function Person:toString()
        return self.name .. ":" .. self.age .. ":" .. (self.handome and "handsome" or "ugly")
    end

    local me = Person:new()
    -- wrong call me.toString(), me.toString(me) is right and me:toString()
    print(me:toString())
    print(me.toString(me))

    local kf = Person:new({name="king's fucking", age = 56, handome= false })
    print(kf:toString())

    local Student = Person:new()
    function Student:new()
        local obj = {year=2013}
        self.__index = self
        return setmetatable(obj, self)
    end
    function Student:toString()
        return "student " .. self.year .. ":" .. self.name
    end

    local sa = Student:new()
    print(sa:toString())
end

test_oo()

user_dir = "/Users/Akon-Home/workspace/cxx/Lua-Study/src/"
package.path = package.path .. ";"..user_dir.."?.lua;;"

local function test_module()
    local module = require "study" --只有第一次加载时会执行一次
    local study = loadfile(user_dir.."study.lua")--只加载与编译，不运行
    dofile(user_dir.."study.lua")--每次加载与运行
    dofile(user_dir.."study.lua")
    study()
    module.Greeting()
end
test_module()