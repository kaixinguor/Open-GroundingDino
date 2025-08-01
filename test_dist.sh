GPU_NUM=1
CFG=config/cfg_coco.py
DATASETS=config/datasets_od_example.json
OUTPUT_DIR=output/od_example
NNODES=${NNODES:-1}
NODE_RANK=${NODE_RANK:-0}
PORT=${PORT:-29500}
MASTER_ADDR=${MASTER_ADDR:-"127.0.0.1"}

python -m torch.distributed.launch  --nproc_per_node=${GPU_NUM} main.py \
        --output_dir ${OUTPUT_DIR} \
        --eval \
        -c ${CFG} \
        --datasets ${DATASETS}  \
        --pretrain_model_path weights/groundingdino_swint_ogc.pth \
        --options text_encoder_type=weights/bert
