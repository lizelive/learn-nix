# make sure you're logged in with `huggingface-cli login`
from diffusers import OnnxStableDiffusionPipeline

pipe = OnnxStableDiffusionPipeline.from_pretrained(
    "runwayml/stable-diffusion-v1-5",
    revision="onnx",
    provider= "TensorrtExecutionProvider", # "CUDAExecutionProvider",
)

prompt = "a photo of an astronaut riding a horse on mars"
image = pipe(prompt).images[0]