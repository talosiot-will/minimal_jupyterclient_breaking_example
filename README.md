# Jupyter client 6.1.13 breaking change example

[Jupyter client](https://github.com/jupyter/jupyter_client) 6.1.13 breaks nbdev test.

How to recreate

```bash
git clone https://github.com/talosiot-will/minimal_jupyterclient_breaking_example.git
cd minimal_jupyterclient_breaking_example
make env
make test
```

This will install jupyter-client 6.1.12 and run `nbdev_test_nbs`.  It will work just fine.


Next upgrade to 6.1.13.

`pip install --upgrade jupyter-client==6.1.13` and ignore the warning pip gives you about the dependency resolved.  (Alternatively, you can edit line 28 of settings.ini to read `requirements =  jupyter-client==6.1.13`)

Now `make test` again and you will receive an error message 


```
[minimal_jupyterclient_breaking_example] [ubuntu@devworkhorse minimal_jupyterclient_breaking_example]$  make test
. .venv/bin/activate && nbdev_test_nbs
testing /home/ubuntu/minimal_jupyterclient_breaking_example/nbs/index.ipynb
Error in /home/ubuntu/minimal_jupyterclient_breaking_example/nbs/index.ipynb:
'coroutine' object is not subscriptable
/home/ubuntu/minimal_jupyterclient_breaking_example/.venv/lib/python3.8/site-packages/nbdev/test.py:97: RuntimeWarning: coroutine 'ZMQSocketChannel.get_msg' was never awaited
  return False,time.time()-start
RuntimeWarning: Enable tracemalloc to get the object allocation traceback
Traceback (most recent call last):
  File "/home/ubuntu/minimal_jupyterclient_breaking_example/.venv/bin/nbdev_test_nbs", line 8, in <module>
    sys.exit(nbdev_test_nbs())
  File "/home/ubuntu/minimal_jupyterclient_breaking_example/.venv/lib/python3.8/site-packages/fastcore/script.py", line 105, in _f
    tfunc(**merge(args, args_from_prog(func, xtra)))
  File "/home/ubuntu/minimal_jupyterclient_breaking_example/.venv/lib/python3.8/site-packages/nbdev/test.py", line 120, in nbdev_test_nbs
    raise Exception(msg + '\n'.join([f.name for p,f in zip(passed,files) if not p]))
Exception: The following notebooks failed:
index.ipynb
Makefile:4: recipe for target 'test' failed
make: *** [test] Error 1
```

