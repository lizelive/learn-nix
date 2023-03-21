# SPDX-FileCopyrightText: 2023-present lize.live <git@lize.live>
#
# SPDX-License-Identifier: MIT
def run():
    print("Hello, world!")
    import torch
    print(torch.__version__)
    print(torch.cuda.is_available())