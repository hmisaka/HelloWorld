# AJAX

## 定义

Ajax（Asynchronous Javascript And XML），即是异步的JavaScript和XML，使用`XMLHttpRequest`对象与服务器通信，也是浏览器与服务器之间的一种异步通信方式。由于具有异步特性，可以在不重刷新页面的情况下与服务器通信，交换数据或更新页面。

## XMLHttpRequest

操作步骤：

1、创建`XMLHttpRequest`对象。2、配置请求方法和请求url地址。

3、监听loadend事件，用于接收服务器响应结果。4、向发起服务器请求。

```js
const xhr = new XMLHttpRequest();
xhr.open('请求方法', '请求url网址');
xhr.addEventListener('loadend', ()=>{
   //响应结果
    console.log(xhr.response);
});
xhr.send();  //发起请求
```

带参数的数据提交

```js
//传递给服务器的内容类型，是json字符串
xhr.setRequestHeader('Content-Type', 'application/json');
//对象转换为json字符串
const user = {username:'czs', password:'123456'};
const userStr = JSON.stringify(user);
//发送请求体数据
xhr.send(userStr);
```

## Promise

`promise`对象用于表示一个异步操作的最终完成（或失败）及其结果值。

```js
// 1.创建promise对象  pending待定状态
const p = new Promise((resolve, reject) => {
    //执行异步代码
    setTimeout(() => {
        // pending状态 => resolve() => 'fulfilled状态-已兑现' => then()
        resolve('模拟AJAX请求-成功结果');
        // pending状态 => reject() => 'reject状态-已拒绝' => catch()
        reject('模拟AJAX请求-失败结果');
    }, 2000);
})
p.then(res => {
    console.log(res);
});
p.catch(res => {
    console.log(res);
});
```

基于XMLHttpRequest和Promise封装axios

```js
function request(config) {
    return new Promise((resolve, reject) => {
        const xhr = new XMLHttpRequest();
        //判断是否有请求参数传递
        if (config.params) {
            const paramsObj = new URLSearchParams(config.params);
            const queryString = paramsObj.toString();  //将对象转换为字符串表示形式
            config.url += `?${queryString}`;
        }
        xhr.open(config.method || 'GET', config.url);
        xhr.addEventListener('loadend', () => {
            if (xhr.status >= 200 && xhr.status < 300) {
                resolve(JSON.parse(xhr.response));  //json转对象
            }
            else {
                reject(new Error(xhr.response));
            }
        });
        if (config.data) {
            const jsonStr = JSON.stringify(config.data);  //对象转json字符串
            xhr.setRequestHeader('Content-Type', 'application/json');
            xhr.send(jsonStr);
        }
        else {
            xhr.send();  //发起请求
        }
    })
}
request({
    url: "http://ajax-api.itheima.net/api/area",
    params: {
        pname: '河北省',
        cname: '石家庄市'
    }
}).then(res => {
    console.log(res);
})


```



