#include<stdio.h>
#include<stdlib.h>
#include<string.h>

// 实现： 读取 numbers.txt 然后将其转换为 decode.txt

#define LINE_NUM 20
#define COLU_NUM 30

int main(int argc, char *argv[])
{
	FILE *fp;
	FILE *fp2;
	fp = fopen("numbers.txt", "r");
	fp2 = fopen("decode.txt", "w+");

	char dict[11] = {' ', '.', ',', ':', ';', '~', '=', '*', '%', '#', '\0'};

	// 将 numbers.txt 内的数字阵列， load进内存
	int num = 0;
	int array[LINE_NUM][COLU_NUM];
	for (int i = 0; i < LINE_NUM; i++) {
		for (int k = 0; k < COLU_NUM; k++) {
			num = fgetc(fp) - 48;
			if (num <= -1) {
				--k; // 解决读文件时， 行末的换行符也会读进来的问题
				continue;
			}
			else {
				array[i][k] = num;
			}
		}
	}
	
	// 解码
	char ch = 0;
	int inti = 0;
	int val = 0;
	for (int i = 0; i < LINE_NUM; i++) {
		for (int k = 0; k < COLU_NUM; k++) {
			ch = dict[array[i][k]];
			fprintf(fp2, "%c ", ch);
		}
		fprintf(fp2, "\n");
	}
	fclose(fp);
	fclose(fp2);
}
