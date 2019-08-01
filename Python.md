# Tips for Python

## Python virtual environment

### Python environment with virtualenv

The following installs numpy, scipy and jupyter in a python virtual environment:

```
sudo apt install python-virtualenv

virtualenv ./venv


source ./venv/bin/activate

sudo apt-get -y install python-pip python-dev

sudo -H pip install --upgrade pip

sudo -H pip install --upgrade setuptools

sudo -H pip install numpy scipy fastdtw matplotlib

sudo -H pip install jupyter
(the sudo before pip is not always necessary,  it depends on your local configuration).
```

To activate the environment (each time you want to use jupyter):

```
source ./venv/bin/activate
```

This configures the binary and python search path to prefer the python configuration
in the virtual environment.
To deactivate the environment type:

```
deactivate
```
To start a the notebook environment in Jupyter
```
jupyter notebook
```

### Python environment with miniconda
* Install https://docs.conda.io/en/latest/miniconda.html
  This allows you to create an isolated Python environment.

* `conda create --name YOURENVIRONMENT_NAME python=3.6 matplotlib scipy ipython pylint`
* `conda activate YOURENVIRONMENT_NAME`
