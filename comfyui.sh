#!/bin/bash

# 1. Install Custom Nodes
# Required for your workflow: ComfyUI-Manager, TAESD, and Upscale tools
nodes=(
    "https://github.com/ltdrdata/ComfyUI-Manager"
    "https://github.com/comfyanonymous/ComfyUI-TAESD"
    "https://github.com/ssitu/ComfyUI_Essentials"
)

for node in "${nodes[@]}"; do
    git clone "$node" /opt/ComfyUI/custom_nodes/$(basename "$node")
done

# 2. Pre-install Models from your workflow
# Base: SDXL Turbo
wget -O /opt/ComfyUI/models/checkpoints/sd_xl_turbo_1.0_fp16.safetensors \
    "https://huggingface.co/stabilityai/sdxl-turbo/resolve/main/sd_xl_turbo_1.0_fp16.safetensors"

# LoRA: SDXL Lightning 8-step
wget -O /opt/ComfyUI/models/loras/sdxl_lightning_8step_lora.safetensors \
    "https://huggingface.co/ByteDance/SDXL-Lightning/resolve/main/sdxl_lightning_8step_lora.safetensors"

# Upscaler: RealESRGAN_x4.pth
wget -O /opt/ComfyUI/models/upscale_models/RealESRGAN_x4.pth \
    "https://huggingface.co/ai-forever/Real-ESRGAN/resolve/main/RealESRGAN_x4.pth"

# TAESD: Tiny VAE for SDXL (Required for Node 13)
wget -O /opt/ComfyUI/models/vae_approx/taesdxl.safetensors \
    "https://github.com/madebyollin/taesd/raw/main/taesdxl.safetensors"