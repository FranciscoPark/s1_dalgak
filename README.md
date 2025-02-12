# s1_dalgak

1. llama factory folder에서 해당 파일 열어서
    /home/n3/jongyeon/LLaMA-Factory/data/dataset_info.json

    dataset_info.json에 있는거 복붙하기 (dataset경로 수정 필수)
    dataset 역시 s1폴더에 존재

2. 해당 yaml 파일 열어서 부분 수정

    1. model_name_or_path: Magpie-Align/Llama-3.1-8B-Magpie-Align-SFT-v0.2

    2. deepspeed 경로 수정(라마팩로리 설정 사용)
        예시: 
        /home/n3/jongyeon/LLaMA-Factory/examples/deepspeed/ds_z3_offload_config.json

    3. output_dir 수정(원하는 곳으로)

    4. run_name 수정

    5. batch_size는 total 16, 현재 4노드 4 지피유 가정해서 작성함

3. submission에서 configpath, partition info 수정

4. runner에서 conda activate snullm, cd ${HOME}/LLaMA-Factory  수정

5. sbatch submission.sh
6. 완성시 snullm-benchmark evaluation
    1. 만약 lora 사용시 lora+ base모델 merge 필수(merge_lora참고)
    2. full시 그냥 바로 snullm eval


