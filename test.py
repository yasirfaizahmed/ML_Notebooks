import torch

print("PyTorch version:", torch.__version__)

# Check CUDA availability
print("CUDA available:", torch.cuda.is_available())

if torch.cuda.is_available():
    print("Number of GPUs:", torch.cuda.device_count())
    for i in range(torch.cuda.device_count()):
        print(f"GPU {i}: {torch.cuda.get_device_name(i)}")
        print(f"  Memory Allocated: {torch.cuda.memory_allocated(i) / 1024**2:.2f} MB")
        print(f"  Memory Cached: {torch.cuda.memory_reserved(i) / 1024**2:.2f} MB")

    # Quick tensor test
    x = torch.rand(3, 3).cuda()
    y = torch.rand(3, 3).cuda()
    z = x + y
    print("Tensor computation successful on GPU:", z)
else:
    print("No GPU detected, running on CPU only.")
