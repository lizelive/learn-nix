nix2container <https://github.com/nlewo/nix2container> is better with cache?


`nix2container` is a tool that provides an efficient container development workflow with images built by Nix. It doesn't write tarballs to the Nix store and allows to skip already pushed layers (without having to rebuild them). It is an archive-less `dockerTools.buildImage` implementation. The tool is in early development stages and interfaces are not stable yet. ¹ 

Is there anything else you would like to know?

Source: Conversation with Bing, 3/20/2023(1) GitHub - nlewo/nix2container: An archive-less dockerTools.buildImage .... https://github.com/nlewo/nix2container Accessed 3/20/2023.
(2) nix2container/README.md at master · nlewo/nix2container - github.com. https://github.com/nlewo/nix2container/blob/master/README.md Accessed 3/20/2023.
(3) github.com/nlewo/nix2container v1.0.0 on Go - Libraries.io. https://libraries.io/go/github.com%2Fnlewo%2Fnix2container Accessed 3/20/2023.