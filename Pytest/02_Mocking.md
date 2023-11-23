# Mocking
- when testing program which may include some data to be fetched from an external source or API, the API could respond slowly or because of the data error the test could fail.
- To avoid these we can use mocking.
- mocking replaces the output a api or function with a specific value that we define.

```python
from unittest import mock
@mock.patch('basics.service.get_user_from_db')
def test_get_user(mock_get_user_from_db):
    mock_get_user_from_db.return_value = 'Mocked Alice' #set the return value for the decorated function to mocked alice whenver it is called
    user_name = service.get_user_from_db(1)

    assert user_name == 'Mocked Alice'
```

- use the mock.patch as decorator to define which function to mock
- then when ever the decorated function is called the return value is returned as defined in the code.

```python
@mock.patch('requests.get')
def test_get_users(mock_get):
    mock_response = mock.Mock()
    mock_response.status_code =200
    mock_response.json.return_value ={ 'id' :1, 'name' :'John'}
    mock_get.return_value =mock_response
    data = service.get_users()
    assert data ==  {'id' :1, 'name' :'John'}
```
