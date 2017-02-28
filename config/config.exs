# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :pwnr, master_node: :"a@127.0.0.1"

config :pwnr, slave_nodes: [:"b@127.0.0.1",
                            :"c@127.0.0.1",
                            :"d@128.0.0.1"]
