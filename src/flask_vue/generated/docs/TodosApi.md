# TodoMvcApi.TodosApi

All URIs are relative to */*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createTodo**](TodosApi.md#createTodo) | **POST** /todos/ | Create a new task
[**deleteTodo**](TodosApi.md#deleteTodo) | **DELETE** /todos/{id} | Delete a task given its identifier
[**getTodo**](TodosApi.md#getTodo) | **GET** /todos/{id} | Fetch a given resource
[**listTodos**](TodosApi.md#listTodos) | **GET** /todos/ | List all tasks
[**putTodo**](TodosApi.md#putTodo) | **PUT** /todos/{id} | Update a task given its identifier

<a name="createTodo"></a>
# **createTodo**
> Todo createTodo(body, opts)

Create a new task

### Example
```javascript
import TodoMvcApi from 'todo_mvc_api';

let apiInstance = new TodoMvcApi.TodosApi();
let body = new TodoMvcApi.Todo(); // Todo | 
let opts = { 
  'xFields': "xFields_example" // String | An optional fields mask
};
apiInstance.createTodo(body, opts, (error, data, response) => {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
});
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Todo**](Todo.md)|  | 
 **xFields** | **String**| An optional fields mask | [optional] 

### Return type

[**Todo**](Todo.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="deleteTodo"></a>
# **deleteTodo**
> deleteTodo(id)

Delete a task given its identifier

### Example
```javascript
import TodoMvcApi from 'todo_mvc_api';

let apiInstance = new TodoMvcApi.TodosApi();
let id = 56; // Number | The task identifier

apiInstance.deleteTodo(id, (error, data, response) => {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
});
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Number**| The task identifier | 

### Return type

null (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

<a name="getTodo"></a>
# **getTodo**
> Todo getTodo(id, opts)

Fetch a given resource

### Example
```javascript
import TodoMvcApi from 'todo_mvc_api';

let apiInstance = new TodoMvcApi.TodosApi();
let id = 56; // Number | The task identifier
let opts = { 
  'xFields': "xFields_example" // String | An optional fields mask
};
apiInstance.getTodo(id, opts, (error, data, response) => {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
});
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Number**| The task identifier | 
 **xFields** | **String**| An optional fields mask | [optional] 

### Return type

[**Todo**](Todo.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a name="listTodos"></a>
# **listTodos**
> [Todo] listTodos(opts)

List all tasks

### Example
```javascript
import TodoMvcApi from 'todo_mvc_api';

let apiInstance = new TodoMvcApi.TodosApi();
let opts = { 
  'xFields': "xFields_example" // String | An optional fields mask
};
apiInstance.listTodos(opts, (error, data, response) => {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
});
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **xFields** | **String**| An optional fields mask | [optional] 

### Return type

[**[Todo]**](Todo.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a name="putTodo"></a>
# **putTodo**
> Todo putTodo(bodyid, opts)

Update a task given its identifier

### Example
```javascript
import TodoMvcApi from 'todo_mvc_api';

let apiInstance = new TodoMvcApi.TodosApi();
let body = new TodoMvcApi.Todo(); // Todo | 
let id = 56; // Number | The task identifier
let opts = { 
  'xFields': "xFields_example" // String | An optional fields mask
};
apiInstance.putTodo(bodyid, opts, (error, data, response) => {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
});
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Todo**](Todo.md)|  | 
 **id** | **Number**| The task identifier | 
 **xFields** | **String**| An optional fields mask | [optional] 

### Return type

[**Todo**](Todo.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

