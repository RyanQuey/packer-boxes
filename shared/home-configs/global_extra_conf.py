# https://github.com/ycm-core/YouCompleteMe/blob/321700e848595af129d5d75afac92d0060d3cdf9/README.md#configuring-through-vim-options
def Settings( **kwargs ):
  client_data = kwargs[ 'client_data' ]
  return {
    'interpreter_path': client_data[ 'g:ycm_python_interpreter_path' ],
    'sys_path': client_data[ 'g:ycm_python_sys_path' ]
  }
