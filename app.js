//使用express创建web服务器
const express=require("express");
const mysql=require("mysql")
//引入第三方插件处理post请求
const bodyParse=require("body-parser")
const session=require("express-session")


var cors=require("cors");

const pool=mysql.createPool({
    host     : process.env.MYSQL_HOST,
    port     : process.env.MYSQL_PORT,
    user     : process.env.ACCESSKEY,
    password : process.env.SECRETKEY,
    database : 'app_' + process.env.APPNAME
});

//构建服务器
var server=express();
server.listen(5050);
server.use(express.static("public"));

//配置模块对象
server.use(session({
    secret:"128位密钥",     //配置密钥
    resave:true,            //每次请求是否更新数据
    saveUninitialized:true  //是否保存初始化数据
}))


server.use(bodyParse.urlencoded({//处理post请求
    extended:false
}))

//启用cors跨域,只允许http://127.0.0.1:3000的请求访问该服务端
server.use(cors({
    "origin":["http://127.0.0.1:8080","http://127.0.0.1:5500"],
    credentials:true//
}))

//处理客户端请求
//登录/login
 server.post("/login",(req,res)=>{
     var uname=req.body.name
     var upwd=req.body.pwd
     console.log(uname,upwd)
     var sql="select uid,uname from shop_user where uname=? and upwd=md5(?)"
     pool.query(sql,[uname,upwd],(err,result)=>{
         if(err)throw err
         if(result.length>0){
             //保存用户编号
             res.send({code:1,data:result})
         }else{
             res.send({code:-1,msg:"用户名或者密码错误"})
         }
     })
 })

/*用户注册 */
server.post("/sign_in",(req,res)=>{
    var $name=req.body.name
    var $pwd=req.body.pwd
    var $phone=req.body.phone
    console.log(req.body)
    var sql="insert into shop_user values(null,?,md5(?),?)"
    pool.query(sql,[$name,$pwd,$phone],(err,result)=>{
        if(err) throw err
        if(result.affectedRows>0){
            res.send({code:1,msg:"注册成功"})
        }
    })
})

/*用户名检索 */
server.post("/search",(req,res)=>{
    var $name=req.body.name
    var sql="select uid from shop_user where uname=?"
    pool.query(sql,[$name],(err,result)=>{
        if(err) throw err
        if(result.length>0){
            res.send({code:-1,msg:"用户名已存在"})
            console.log(result)
        }else{
            res.send({code:1,msg:"用户名可以使用"})
            console.log(result)
        }
    })
})   




//底部小轮播
server.get("/carousel",(req,res)=>{
    var start=parseInt(req.query.start)
    var count=parseInt(req.query.count)

    var sql="select id,lei,title,dis,price,src from small_carousel limit ?,?";
    pool.query(sql,[start,count],(err,result)=>{
        if(err)throw err
        res.send({code:1,data:result})
    })
})

//头部大轮播
server.get("/bcarousel",(req,res)=>{
    var sql="select id,src,chose from big_carousel_img";
    pool.query(sql,(err,result)=>{
        if(err)throw err
        res.send({code:1,data:result})
    })
})
//大轮播左侧
server.get("/leftLest",(req,res)=>{

    var sql="select lid,title,url,name from big_carousel_left left outer join big_carousel_left_items on lid=nid";
    pool.query(sql,(err,result)=>{
        if(err)throw err
        res.send({code:1,data:result})
    })
    
})

//商品详情页第一部分
server.get("/products1",(req,res)=>{
    var name=req.query.name
    var sql="select * from shop_products where pname=?"
    pool.query(sql,[name],(err,result)=>{
        if(err) throw err
        res.send({code:1,data:result})
    })
})
//商品详情页第二部分
server.get("/products2",(req,res)=>{
    var name=req.query.name
    var sql="select * from pro_second"
    pool.query(sql,(err,result)=>{
        if(err) throw err
        res.send({code:1,data:result})
    })
})

//购物车列表
server.get('/cart',(req,res)=>{
    var uid=req.query.uid
    var sql='select pid,pname,price,img,count,total,chosed from shop_cart where uid=?'
    pool.query(sql,[uid],(err,result)=>{
        if(err) throw err
        if(result.length>0){
            res.send({code:1,data:result})
        }else{
            res.send({code:-1,msg:"购物车为空"})
        }
    })
})
//删除购物车端口
    server.get("/del",(req,res)=>{
        var pid=req.query.pid
        var sql='delete from shop_cart where pid=?'
        pool.query(sql,[pid],(err,result)=>{
            if(err) throw err
            res.send({code:1,msg:'删除成功'})
        })
    })

//加入购物车端口
    server.post('/addcart',(req,res)=>{
        var pname=req.body.pname
        var price=req.body.price
        var img=req.body.img
        var count=req.body.count
        var chosed=req.body.chosed
        var uid=parseInt(req.body.uid)
        console.log(uid)
        if(!count)count=1
        if(!chosed)chosed=0
        var sql='select count,price from shop_cart where pname=? and uid=?'
        pool.query(sql,[pname,uid],(err,result)=>{
            if(err)throw err
            if(result.length>0){
                for(var i=0;i<result.length;i++){
                    var count1=parseInt(result[i].count+1)
                    var total1=parseFloat(result[i].price)*count1
                }
                var sql1='update shop_cart set count=?,total=? where pname=? and uid=?'
                pool.query(sql1,[count1,total1,pname,uid],(err,result)=>{
                    if(err) throw err
                    res.send({code:1,msg:'加入购物车成功'})
                }) 
            }else{
                var total=price
                var sql2="insert into shop_cart values(null,?,?,?,?,?,?,?)"
                pool.query
                (sql2,[pname,price,img,count,total,chosed,uid],(err,result)=>{
                    if(err)throw err
                    res.send({code:1,msg:'加入购物车成功'})
                })
            }
        })
    })

    //商品数量+号
    server.get('/addone',(req,res)=>{
        var pid=req.query.pid
        var sql='select count,price from shop_cart where pid=?'
        pool.query(sql,[pid],(err,result)=>{
            if(err)throw err
            var count=result[0].count+1
            var total=result[0].price*count
            var sql='update shop_cart set count=?,total=? where pid=?'
            pool.query(sql,[count,total,pid],(err,result)=>{
                if(err)throw err
                res.send({code:1,meg:'success'})
            })
        })
        
    })
    //单独查询数量增加的数据
    server.get('/addcha',(req,res)=>{
        var pid =req.query.pid
        var sql='select count,total from shop_cart where pid=?'
        pool.query(sql,[pid],(err,result)=>{
            if(err)throw err
            res.send({code:1,data:result})
        })
    })
    //商品数量-号
    server.get('/subone',(req,res)=>{
        var pid=req.query.pid
        var sql='select count,price from shop_cart where pid=?'
        pool.query(sql,[pid],(err,result)=>{
            if(err)throw err
            if(result[0].count>1){
                var count=result[0].count-1
                var total=result[0].price*count
                var sql='update shop_cart set count=?,total=? where pid=?'
                pool.query(sql,[count,total,pid],(err,result)=>{
                    if(err)throw err
                    res.send({code:1,meg:'success'})
                })
            }
        })    
    })
  //单独查询数量减少的数据
  server.get('/subcha',(req,res)=>{
    var pid =req.query.pid
    var sql='select count,total from shop_cart where pid=?'
    pool.query(sql,[pid],(err,result)=>{
        if(err)throw err
        res.send({code:1,data:result})
    })
})
//购物车推荐列表
server.get('/commend',(req,res)=>{
    var sql='select img,pname,price,est from commend';
    pool.query(sql,(err,result)=>{
        if(err) throw err
        res.send({code:1,data:result})
    })
})

/**搜索商品端口 */
server.get('/soso',(req,res)=>{
    var pno=req.query.pno
    var pageSize=req.query.pageSize
    var str=req.query.str
    if(!pno){pno=1}
    if(!pageSize){pageSize=3}
    var offset=(pno-1)*pageSize
    var obj={}
    var sql0="select count(title) AS n from products_list where title like concat('%',?,'%')"
    pool.query(sql0,[str],(err,result)=>{
        if(err)throw err
        var pages=parseInt(result[0].n)
        obj.pageCount=Math.ceil(pages/pageSize)
        
        var sql="select img,img0,img1,img2,img3,img4,title,price,imgs from products_list where title like concat('%',?,'%') limit ?,?"
       
        pool.query(sql,[str,offset,pageSize],(err,result)=>{
            if(err) throw err
           if(result.length>0){
                obj.data=result
                obj.code=1
                res.send(obj)
           }else{
               obj.code=-1
               res.send(obj)
               }
               
           })
    })        

})