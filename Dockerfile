# base image
FROM python:3

# set up package installer
RUN apt-get update && apt-get -y install sudo

# install neovim
RUN sudo apt-get -y install neovim
RUN sudo apt-get install python3-neovim
RUN pip3 install --user pynvim 

# install neovim packages
RUN pip3 install yapf flake8 isort pudb ipython

# install rl pip packages
#RUN pip3 install pygifsicle imageio plotly bayesian-optimization numpy tqdm gym matplotlib argparse torch wandb scipy h5py optuna

# configurations for pudb to run
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en
ENV LC_ALL C

# configure neovim to install all needed packages
ADD ./init.vim /root/.config/nvim/init.vim
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	 https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN nvim +PlugInstall +qa

# install and configure tmux
ADD ./tmux.conf /root/.tmux.conf
RUN sudo apt -y install tmux
RUN echo 'alias tmux="tmux -2"' >> ~/.bashrc

# attach to shell
CMD /bin/bash 
