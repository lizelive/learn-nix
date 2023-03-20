# from accelerate import Accelerator

# accelerator = Accelerator()



from diffusers import StableDiffusionPipeline, UniPCMultistepScheduler
import torch
torch.backends.cuda.matmul.allow_tf32 = True
torch.backends.cudnn.benchmark = True
torch.backends.cudnn.allow_tf32 = True
model_id = "stabilityai/stable-diffusion-2-1-base"


# revision = "fp16"
pipe = StableDiffusionPipeline.from_pretrained(model_id, revision = "fp16",
    device_map = "auto",
    torch_dtype = torch.float16
)

pipe.scheduler = UniPCMultistepScheduler.from_config(pipe.scheduler.config)


# pipe = pipe.to(accelerator.device)
# pipe = pipe.to("cuda")

# pipe.unet = torch.compile(pipe.unet)
# pipe.unet = torch.jit.script(pipe.unet)
pipe.vae = torch.compile(pipe.vae)


# def wraper(*args, **kwargs):
#     return pipe(*args, **kwargs)

# pipe = torch.compile(wraper)

# pipe.enable_xformers_memory_efficient_attention()

prompt = "a photo of an astronaut riding a horse on mars"
batch_size = 1
for i in range(2):
    image = pipe(prompt, num_images_per_prompt=batch_size).images[0]  
    
image.save("out.png")

