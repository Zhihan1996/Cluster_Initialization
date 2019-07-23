# Cluster Initionlizing

##1. Cancel the ssh password

- Clone this repo 

  ```
  git clone https://github.com/Zhihan1996/Cluster_Initialization
  ```

- Open the ***ssh_password.sh***, change the variable ***USER*** to your own username. 

  ```
  Note: if you do not have a username yet, please contact me at zhihanzhou2020@u.northwestern.edu.
  ```

- Run the shell script in your local terminal 

  ```
  cd Cluster_Initialization
  sh ssh_password.sh
  ```

  Enter your password when it is asked. Otherwise, press "Enter".





## 2. Open vnc server for graphical interface (Optional)

- Download vnc viewer at https://www.realvnc.com/en/connect/download/viewer/

- Connect to the container

  ```
  ssh {username}@192.168.100.10{x} -p 12345  
  ```

  **x** here can be 1 to 7

- Open a vncserver in the container

- ```
  vncserver :{y}
  ```

  - Here the **y** stands for port number, which could be any number less than 100 and larger than 3. Each user would have a unique port number. If the **x** you chose has been occupied, try another one!
  - Set your own password for vnc viewer

- Open the vnc viewer, type the address

  ```
  192.168.100.10{x}:{z}
  ```

  where **z**=5900+**y**





## 3. Create conda environment for Python

- Download anaconda and install it

  ```
  wget https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh
  sh Anaconda3-2019.03-Linux-x86_64.sh
  ```

- Create a virtual environment and activate it

  ```
  conda create -n {name} python=3.{x}
  conda activate {name}
  ```

- Install the required package

  ```
  conda install tensorflow-gpu
  conda install pytorch torchvision cudatoolkit=10.0 -c pytorch
  conda install gcc_linux-64 gxx_linux-64
  HOROVOD_GPU_ALLREDUCE=NCCL HOROVOD_WITH_PYTORCH=1 HOROVOD_WITH_TENSORFLOW=1 pip install --no-cache-dir horovod
  ```





##4. Run distributed training with Horovod

- Modify your code based on official guidance: https://github.com/horovod/horovod

- An example of training model on node 2, 4, 6 with 12 GPUs is 

  ```
  horovodrun -p 12345 -np 12 -H 10.0.1.22:4,10.0.1.24:4,10.0.1.26:4 python tensorflow_mnist.py
  ```

  Here the 10.0.1.2{x} stands for the IP address of Infiniband Interface of $x_{th}$ cluster node. 

  You should always use this IP address for distributed training instead of the one start with 192.168...