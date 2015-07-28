#include "unit_test.h"


void runAllTest(){
	int counter = 0;
	int success = 0;

	if(test_add_v_f()){ ++ success;} ++ counter;
	if(test_add_v_v()){ ++ success;} ++ counter;
	if(test_add_m_f()){ ++ success;} ++ counter;
	if(test_add_m_v()){ ++ success;} ++ counter;
	if(test_add_m_m()){ ++ success;} ++ counter;
	if(test_subtract_v_f()){ ++ success;} ++ counter;
	if(test_subtract_v_v()){ ++ success;} ++ counter;
	if(test_subtract_m_f()){ ++ success;} ++ counter;
	if(test_subtract_m_v()){ ++ success;} ++ counter;
	if(test_subtract_m_m()){ ++ success;} ++ counter;
	if(test_multiply_elem_v_f()){ ++ success;} ++ counter;
	if(test_multiply_elem_v_v()){ ++ success;} ++ counter;
	if(test_multiply_elem_m_f()){ ++ success;} ++ counter;
	if(test_multiply_elem_m_v()){ ++ success;} ++ counter;
	if(test_multiply_elem_m_m()){ ++ success;} ++ counter;
	if(test_multiply()){ ++ success;} ++ counter;
	if(test_t()){ ++ success;} ++ counter;
	if(test_div_rem()){ ++ success;} ++ counter;
	if(test_div_no_rem()){ ++ success;} ++ counter;
	if(test_divide_m_f()){ ++ success;} ++ counter;
	if(test_divide_f_m()){ ++ success;} ++ counter;
	if(test_divide_v_f()){ ++ success;} ++ counter;
	if(test_divide_f_v()){ ++ success;} ++ counter;
	if(test_divide_m_v()){ ++ success;} ++ counter;
	if(test_divide_v_m()){ ++ success;} ++ counter;
	if(test_divide_m_m()){ ++ success;} ++ counter;
	if(test_divide_v_v()){ ++ success;} ++ counter;

	if(test_exp()){ ++ success;} ++ counter;
	if(test_log()){ ++ success;} ++ counter;
	if(test_pow()){ ++ success;} ++ counter;
	if(test_square_m()){ ++ success;} ++ counter;
	if(test_square_v()){ ++ success;} ++ counter;
	if(test_sqrt_m()){ ++ success;} ++ counter;
	if(test_sqrt_v()){ ++ success;} ++ counter;
	if(test_sum_v()){ ++ success;} ++ counter;
	if(test_sum_m()){ ++ success;} ++ counter;
	if(test_average()){ ++ success;} ++ counter;
	if(test_stddev()){ ++ success;} ++ counter;
	if(test_max_v()){ ++ success;} ++ counter;
	if(test_max_m()){ ++ success;} ++ counter;
	if(test_min_v()){ ++ success;} ++ counter;
	if(test_min_m()){ ++ success;} ++ counter;
	if(test_maxLoc()){ ++ success;} ++ counter;
	if(test_minLoc()){ ++ success;} ++ counter;
	if(test_minMaxLoc()){ ++ success;} ++ counter;
	if(test_greaterThan()){ ++ success;} ++ counter;
	if(test_lessThan()){ ++ success;} ++ counter;

	if(test_convert_vv()){ ++ success;} ++ counter;
	if(test_convert_m()){ ++ success;} ++ counter;
	if(test_sigmoid()){ ++ success;} ++ counter;
	if(test_dsigmoid()){ ++ success;} ++ counter;
	if(test_dsigmoid_a()){ ++ success;} ++ counter;
	if(test_ReLU()){ ++ success;} ++ counter;
	if(test_dReLU()){ ++ success;} ++ counter;
	if(test_LeakyReLU()){ ++ success;} ++ counter;
	if(test_dLeakyReLU()){ ++ success;} ++ counter;
	if(test_Tanh()){ ++ success;} ++ counter;
	if(test_dTanh()){ ++ success;} ++ counter;

	if(test_fliplr()){ ++ success;} ++ counter;
	if(test_rot90()){ ++ success;} ++ counter;
	if(test_dopadding()){ ++ success;} ++ counter;
	if(test_depadding()){ ++ success;} ++ counter;
	if(test_reduce()){ ++ success;} ++ counter;
	if(test_getRange()){ ++ success;} ++ counter;
	if(test_interpolation()){ ++ success;} ++ counter;
	if(test_repmat()){ ++ success;} ++ counter;
	if(test_downSample()){ ++ success;} ++ counter;
	if(test_copyMakeBorder()){ ++ success;} ++ counter;
	if(test_kron()){ ++ success;} ++ counter;
	if(test_conv2_kernel()){ ++ success;} ++ counter;
	if(test_conv2()){ ++ success;} ++ counter;



	cout<<"test success : "<<success<<", failed : "<<counter - success<<", total : "<<counter<<endl;
}

// get data
Mat* getTestMatrix_5(){
	Mat *m = new Mat(5, 5, 3);
	for(int i = 0; i < m -> getLength(); ++i){
		m -> set(i, (float)i / 10.0);
	}
	return m;
}

Mat* getTestMatrix_3(){
	Mat *m = new Mat(3, 3, 3);
	for(int i = 0; i < m -> getLength(); ++i){
		m -> set(i, (float)i / 10.0);
	}
	return m;
}

vector3f* getTestVector3f_0(){
	vector3f *v = new vector3f();
	for(int i = 0; i < 3; ++i){
		v -> set(i, (float)(i + 1) / 4.0);
	}
	return v;
}

vector3f* getTestVector3f_1(){
	vector3f *v = new vector3f();
	for(int i = 0; i < 3; ++i){
		v -> set(i, (float)(i + 1) / 4.0 + 3.0);
	}
	return v;
}

void getTestVectorVectorMat(std::vector<std::vector<Mat*> >& vec){
	vec.clear();
	vec.resize(3);
	for(int i = 0; i < vec.size(); ++i){
		vec[i].clear();
		vec[i].resize(2);
		for(int j = 0; j < vec[i].size(); ++j){
			vec[i][j] = getTestMatrix_3();
		}
	}
}

float getTestFloat(){
	return 0.5;
}

int getTestInt(){
	return 2;
}

bool hostEqualToDevice(const Mat* a){
	if(NULL == a -> hostData || NULL == a -> devData) return false;
	float *tmpMemory = (float*)MemoryMonitor::instance()->cpuMalloc(a -> getLength() * sizeof(float));
	cudaMemcpy(tmpMemory, a -> devData, a -> getLength() * sizeof(float), cudaMemcpyDeviceToHost);
	int n = memcmp(tmpMemory, a -> hostData, a -> getLength() * sizeof(float));
	free(tmpMemory);
	return 0 == n ? true : false;
}

bool areIdentical(const std::vector<std::vector<Mat*> >& a, const std::vector<std::vector<Mat*> >& b){
	if(a.size() != b.size()) return false;
	for(int i = 0; i < a.size(); ++i){
		if(a[i].size() != b[i].size()) return false;
		for(int j = 0; j < a[i].size(); ++j){
			if(!areIdentical(a[i][j], b[i][j])) return false;
		}
	}
	return true;
}

bool areIdentical(const Mat* a, const Mat* b){
	if(NULL == a || NULL == b) return false;
	if(NULL == a -> hostData && NULL == a -> devData && NULL == b -> hostData && NULL == b -> devData){
		return true;
	}
	if(NULL == a -> hostData || NULL == a -> devData || NULL == b -> hostData || NULL == b -> devData){
		return false;
	}
	if(a -> getLength() != b -> getLength()) return false;
	if(!hostEqualToDevice(a) || !hostEqualToDevice(b)) return false;
	int n = memcmp(b -> hostData, a -> hostData, a -> getLength() * sizeof(float));
	return 0 == n ? true : false;
}

bool areIdentical(const cpuMat* a, const cpuMat* b){
	if(NULL == a || NULL == b) return false;
	if(NULL == a -> Data && NULL == b -> Data){
		return true;
	}
	if(NULL == a -> Data || NULL == b -> Data){
		return false;
	}
	if(a -> getLength() != b -> getLength()) return false;
	int n = memcmp(b -> Data, a -> Data, a -> getLength() * sizeof(float));
	return 0 == n ? true : false;
}

bool areIdentical(const vector3f* a, const vector3f* b){
	if(NULL == a || NULL == b) return false;
	for(int i = 0; i < 3; ++i){
		if(a -> get(i) != b -> get(i)) return false;
	}
	return true;
}

bool areIdentical(float a, float b){
	return a == b ? true : false;
}

bool areApproximatelyIdentical(const std::vector<std::vector<Mat*> >& a, const std::vector<std::vector<Mat*> >& b){
	if(a.size() != b.size()) {
		return false;
	}
	for(int i = 0; i < a.size(); ++i){
		if(a[i].size() != b[i].size()) {
			return false;
		}
		for(int j = 0; j < a[i].size(); ++j){
			if(!areApproximatelyIdentical(a[i][j], b[i][j])) {
				return false;
			}
		}
	}
	return true;
}

bool areApproximatelyIdentical(const Mat* a, const Mat* b){
	if(NULL == a || NULL == b) return false;
	if(NULL == a -> hostData && NULL == a -> devData && NULL == b -> hostData && NULL == b -> devData){
		return true;
	}
	if(NULL == a -> hostData || NULL == a -> devData || NULL == b -> hostData || NULL == b -> devData){
		return false;
	}
	if(a -> getLength() != b -> getLength()) return false;
	if(!hostEqualToDevice(a) || !hostEqualToDevice(b)) return false;
	for(int i = 0; i < a -> getLength(); ++i){
		float n = b -> hostData[i] - a -> hostData[i];
		if(fabsf(n) > test_tolerance) return false;
	}
	return true;
}

bool areApproximatelyIdentical(const cpuMat* a, const cpuMat* b){
	if(NULL == a || NULL == b) return false;
	if(NULL == a -> Data && NULL == b -> Data){
		return true;
	}
	if(NULL == a -> Data || NULL == b -> Data){
		return false;
	}
	if(a -> getLength() != b -> getLength()) return false;
	for(int i = 0; i < a -> getLength(); ++i){
		float n = b -> Data[i] - a -> Data[i];
		if(fabsf(n) > test_tolerance) return false;
	}
	return true;
}

bool areApproximatelyIdentical(const vector3f* a, const vector3f* b){
	if(NULL == a || NULL == b) return false;
	for(int i = 0; i < 3; ++i){
		float n = a -> get(i) - b -> get(i);
		if(fabsf(n) > test_tolerance) return false;
	}
	return true;
}

bool areApproximatelyIdentical(float a, float b){
	float n = a - b;
	return fabsf(n) <= test_tolerance ? true : false;
}

// tests
bool test_add_v_f(){
	cout<<"testing add_v_f --- ";
	vector3f *a = getTestVector3f_0();
	float b = getTestFloat();
	vector3f *res = NULL;
	res = add(a, b);
	vector3f *expect = new vector3f(0.75, 1.0, 1.25);
	bool result = areApproximatelyIdentical(res, expect);
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_add_v_v(){
	cout<<"testing add_v_v --- ";
	vector3f *a = getTestVector3f_0();
	vector3f *b = getTestVector3f_0();
	vector3f *res = NULL;
	res = add(a, b);
	vector3f *expect = new vector3f(0.50, 1.0, 1.5);
	bool result = areApproximatelyIdentical(res, expect);
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_add_m_f(){
	const float array_add_m_f[27] = {
		0.5000, 0.6000, 0.7000, 0.8000, 0.9000, 1.0000, 1.1000, 1.2000, 1.3000, 
		1.4000, 1.5000, 1.6000, 1.7000, 1.8000, 1.9000, 2.0000, 2.1000, 2.2000, 
		2.3000, 2.4000, 2.5000, 2.6000, 2.7000, 2.8000, 2.9000, 3.0000, 3.1000};
	cout<<"testing add_m_f --- ";
	Mat *a = getTestMatrix_3();
	float b = getTestFloat();
	Mat *res = NULL;
	safeGetPt(res, add(a, b));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_add_m_f, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_add_m_v(){
	const float array_add_m_v[27] = {	
		0.2500, 0.3500, 0.4500, 0.5500, 0.6500, 0.7500, 0.8500, 0.9500, 1.0500,
		1.4000, 1.5000, 1.6000, 1.7000, 1.8000, 1.9000, 2.0000, 2.1000, 2.2000,
		2.5500, 2.6500, 2.7500, 2.8500, 2.9500, 3.0500, 3.1500, 3.2500, 3.3500};
	cout<<"testing add_m_v --- ";
	Mat *a = getTestMatrix_3();
	vector3f *b = getTestVector3f_0();
	Mat *res = NULL;
	safeGetPt(res, add(a, b));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_add_m_v, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_add_m_m(){
	const float array_add_m_m[27] = {	
		0.0000, 0.2000, 0.4000, 0.6000, 0.8000, 1.0000, 1.2000, 1.4000, 1.6000, 
		1.8000, 2.0000, 2.2000, 2.4000, 2.6000, 2.8000, 3.0000, 3.2000, 3.4000, 
		3.6000, 3.8000, 4.0000, 4.2000, 4.4000, 4.6000, 4.8000, 5.0000, 5.2000};
	cout<<"testing add_m_m --- ";
	Mat *a = getTestMatrix_3();
	Mat *b = getTestMatrix_3();
	Mat *res = NULL;
	safeGetPt(res, add(a, b));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_add_m_m, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	b -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_subtract_v_f(){
	cout<<"testing subtract_v_f --- ";
	vector3f *a = getTestVector3f_0();
	float b = getTestFloat();
	vector3f *res = NULL;
	res = subtract(a, b);
	vector3f *expect = new vector3f(-0.25, 0.0, 0.25);
	bool result = areApproximatelyIdentical(res, expect);
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_subtract_v_v(){
	cout<<"testing subtract_v_v --- ";
	vector3f *a = getTestVector3f_0();
	vector3f *b = getTestVector3f_0();
	vector3f *res = NULL;
	res = subtract(a, b);
	vector3f *expect = new vector3f(0.00, 0.00, 0.0);
	bool result = areApproximatelyIdentical(res, expect);
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_subtract_m_f(){
	const float array_subtract_m_f[27] = {
		-0.5000, -0.4000, -0.3000, -0.2000, -0.1000,  0.0000,  0.1000,  0.2000,  0.3000, 
		 0.4000,  0.5000,  0.6000,  0.7000,  0.8000,  0.9000,  1.0000,  1.1000,  1.2000, 
		 1.3000,  1.4000,  1.5000,  1.6000,  1.7000,  1.8000,  1.9000,  2.0000,  2.1000};
	cout<<"testing subtract_m_f --- ";
	Mat *a = getTestMatrix_3();
	float b = getTestFloat();
	Mat *res = NULL;
	safeGetPt(res, subtract(a, b));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_subtract_m_f, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_subtract_m_v(){
	const float array_subtract_m_v[27] = {	
		-0.2500, -0.1500, -0.0500,  0.0500,  0.1500,  0.2500,  0.3500,  0.4500,  0.5500,
		 0.4000,  0.5000,  0.6000,  0.7000,  0.8000,  0.9000,  1.0000,  1.1000,  1.2000,
		 1.0500,  1.1500,  1.2500,  1.3500,  1.4500,  1.5500,  1.6500,  1.7500,  1.8500};
	cout<<"testing subtract_m_v --- ";
	Mat *a = getTestMatrix_3();
	vector3f *b = getTestVector3f_0();
	Mat *res = NULL;
	safeGetPt(res, subtract(a, b));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_subtract_m_v, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_subtract_m_m(){
	const float array_subtract_m_m[27] = {	
		0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 
		0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 
		0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000};
	cout<<"testing subtract_m_m --- ";
	Mat *a = getTestMatrix_3();
	Mat *b = getTestMatrix_3();
	Mat *res = NULL;
	safeGetPt(res, subtract(a, b));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_subtract_m_m, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	b -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_multiply_elem_v_f(){
	cout<<"testing multiply_elem_v_f --- ";
	vector3f *a = getTestVector3f_0();
	float b = getTestFloat();
	vector3f *res = NULL;
	res = multiply_elem(a, b);
	vector3f *expect = new vector3f(0.125, 0.25, 0.375);
	bool result = areApproximatelyIdentical(res, expect);
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_multiply_elem_v_v(){
	cout<<"testing multiply_elem_v_v --- ";
	vector3f *a = getTestVector3f_0();
	vector3f *b = getTestVector3f_0();
	vector3f *res = NULL;
	res = multiply_elem(a, b);
	vector3f *expect = new vector3f(0.0625, 0.25, 0.5625);
	bool result = areApproximatelyIdentical(res, expect);
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_multiply_elem_m_f(){
	const float array_multiply_elem_m_f[27] = {
		0.0000, 0.0500, 0.1000, 0.1500, 0.2000, 0.2500, 0.3000, 0.3500, 0.4000, 
		0.4500, 0.5000, 0.5500, 0.6000, 0.6500, 0.7000, 0.7500, 0.8000, 0.8500, 
		0.9000, 0.9500, 1.0000, 1.0500, 1.1000, 1.1500, 1.2000, 1.2500, 1.3000};
	cout<<"testing multiply_elem_m_f --- ";
	Mat *a = getTestMatrix_3();
	float b = getTestFloat();
	Mat *res = NULL;
	safeGetPt(res, multiply_elem(a, b));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_multiply_elem_m_f, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_multiply_elem_m_v(){
	const float array_multiply_elem_m_v[27] = {	
		0.0000, 0.0250, 0.0500, 0.0750, 0.1000, 0.1250, 0.1500, 0.1750, 0.2000, 
		0.4500, 0.5000, 0.5500, 0.6000, 0.6500, 0.7000, 0.7500, 0.8000, 0.8500, 
		1.3500, 1.4250, 1.5000, 1.5750, 1.6500, 1.7250, 1.8000, 1.8750, 1.9500};
	cout<<"testing multiply_elem_m_v --- ";
	Mat *a = getTestMatrix_3();
	vector3f *b = getTestVector3f_0();
	Mat *res = NULL;
	safeGetPt(res, multiply_elem(a, b));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_multiply_elem_m_v, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_multiply_elem_m_m(){
	const float array_multiply_elem_m_m[27] = {	
		0.0000, 0.0100, 0.0400, 0.0900, 0.1600, 0.2500, 0.3600, 0.4900, 0.6400, 
		0.8100, 1.0000, 1.2100, 1.4400, 1.6900, 1.9600, 2.2500, 2.5600, 2.8900, 
		3.2400, 3.6100, 4.0000, 4.4100, 4.8400, 5.2900, 5.7600, 6.2500, 6.7600};
	cout<<"testing multiply_elem_m_m --- ";
	Mat *a = getTestMatrix_3();
	Mat *b = getTestMatrix_3();
	Mat *res = NULL;
	safeGetPt(res, multiply_elem(a, b));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_multiply_elem_m_m, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	b -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_multiply(){
	const float array_multiply[27] = {	
		0.1500,  0.1800,  0.2100,  0.4200,  0.5400,  0.6600,  0.6900,  0.9000,  1.1100, 
		3.6600,  3.9600,  4.2600,  4.7400,  5.1300,  5.5200,  5.8200,  6.3000,  6.7800, 
		12.0300, 12.6000, 13.1700, 13.9200, 14.5800, 15.2400, 15.8100, 16.5600, 17.3100};
	cout<<"testing multiply --- ";
	Mat *a = getTestMatrix_3();
	Mat *b = getTestMatrix_3();
	Mat *res = NULL;
	safeGetPt(res, multiply(a, b));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_multiply, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	b -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_t(){
	const float array_t[27] = {	
		0.0000, 0.3000, 0.6000, 0.1000, 0.4000, 0.7000, 0.2000, 0.5000, 0.8000, 
		0.9000, 1.2000, 1.5000, 1.0000, 1.3000, 1.6000, 1.1000, 1.4000, 1.7000, 
		1.8000, 2.1000, 2.4000, 1.9000, 2.2000, 2.5000, 2.0000, 2.3000, 2.6000};
	cout<<"testing transpose --- ";
	Mat *a = getTestMatrix_3();
	Mat *res = NULL;
	safeGetPt(res, t(a));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_t, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_div_rem(){
	cout<<"testing div_rem --- ";
	vector3f *a = getTestVector3f_1();
	int b = getTestInt();
	vector3f *res = NULL;
	res = div_rem(a, b);
	vector3f *expect = new vector3f(1, 1, 1);
	bool result = areApproximatelyIdentical(res, expect);
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_div_no_rem(){
	cout<<"testing div_no_rem --- ";
	vector3f *a = getTestVector3f_1();
	int b = getTestInt();
	vector3f *res = NULL;
	res = div_no_rem(a, b);
	vector3f *expect = new vector3f(1, 1, 1);
	bool result = areApproximatelyIdentical(res, expect);
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_divide_m_f(){
	const float array_divide_m_f[27] = {
		0.0000, 0.2000, 0.4000, 0.6000, 0.8000, 1.0000, 1.2000, 1.4000, 1.6000, 
		1.8000, 2.0000, 2.2000, 2.4000, 2.6000, 2.8000, 3.0000, 3.2000, 3.4000, 
		3.6000, 3.8000, 4.0000, 4.2000, 4.4000, 4.6000, 4.8000, 5.0000, 5.2000};
	cout<<"testing divide_m_f --- ";
	Mat *a = getTestMatrix_3();
	float b = getTestFloat();
	Mat *res = NULL;
	safeGetPt(res, divide(a, b));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_divide_m_f, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

// edit zero-element in matrix
bool test_divide_f_m(){
	const float array_divide_f_m[27] = {
		5.0000, 5.0000, 2.5000, 1.6667, 1.2500, 1.0000, 0.8333, 0.7143, 0.6250, 
		0.5556, 0.5000, 0.4545, 0.4167, 0.3846, 0.3571, 0.3333, 0.3125, 0.2941, 
		0.2778, 0.2632, 0.2500, 0.2381, 0.2273, 0.2174, 0.2083, 0.2000, 0.1923};
	cout<<"testing divide_m_f --- ";
	Mat *a = getTestMatrix_3();
	a -> set(0, 0, 0, 0.1);
	float b = getTestFloat();
	Mat *res = NULL;
	safeGetPt(res, divide(b, a));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_divide_f_m, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_divide_v_f(){
	cout<<"testing divide_v_f --- ";
	vector3f *a = getTestVector3f_0();
	float b = getTestFloat();
	vector3f *res = NULL;
	res = divide(a, b);
	vector3f *expect = new vector3f(0.5, 1.0, 1.5);
	bool result = areApproximatelyIdentical(res, expect);
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_divide_f_v(){
	cout<<"testing divide_f_v --- ";
	vector3f *a = getTestVector3f_0();
	float b = getTestFloat();
	vector3f *res = NULL;
	res = divide(b, a);
	vector3f *expect = new vector3f(2.0000, 1.0000, 0.6667);
	bool result = areApproximatelyIdentical(res, expect);
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_divide_m_v(){
	const float array_divide_m_v[27] = {
		0.0000, 0.4000, 0.8000, 1.2000, 1.6000, 2.0000, 2.4000, 2.8000, 3.2000, 
		1.8000, 2.0000, 2.2000, 2.4000, 2.6000, 2.8000, 3.0000, 3.2000, 3.4000, 
		2.4000, 2.5333, 2.6667, 2.8000, 2.9333, 3.0667, 3.2000, 3.3333, 3.4667};
	cout<<"testing divide_m_v --- ";
	Mat *a = getTestMatrix_3();
	vector3f *b = getTestVector3f_0();
	Mat *res = NULL;
	safeGetPt(res, divide(a, b));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_divide_m_v, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

// edit zero-element in matrix
bool test_divide_v_m(){
	const float array_divide_v_m[27] = {
		2.5000, 2.5000, 1.2500, 0.8333, 0.6250, 0.5000, 0.4167, 0.3571, 0.3125, 
		0.5556, 0.5000, 0.4545, 0.4167, 0.3846, 0.3571, 0.3333, 0.3125, 0.2941, 
		0.4167, 0.3947, 0.3750, 0.3571, 0.3409, 0.3261, 0.3125, 0.3000, 0.2885};
	cout<<"testing divide_v_m --- ";
	Mat *a = getTestMatrix_3();
	a -> set(0, 0, 0, 0.1);
	vector3f *b = getTestVector3f_0();
	Mat *res = NULL;
	safeGetPt(res, divide(b, a));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_divide_v_m, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

// edit zero-element in matrix
bool test_divide_m_m(){
	const float array_divide_m_m[27] = {
		1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 
		1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 
		1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0};
	cout<<"testing divide_m_m --- ";
	Mat *a = getTestMatrix_3();
	a -> set(0, 0, 0, 0.1);
	Mat *b = getTestMatrix_3();
	b -> set(0, 0, 0, 0.1);
	Mat *res = NULL;
	safeGetPt(res, divide(a, b));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_divide_m_m, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	b -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_divide_v_v(){
	cout<<"testing divide_v_v --- ";
	vector3f *a = getTestVector3f_0();
	vector3f *b = getTestVector3f_0();
	vector3f *res = NULL;
	res = divide(a, b);
	vector3f *expect = new vector3f(1.0, 1.0, 1.0);
	bool result = areApproximatelyIdentical(res, expect);
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_exp(){
	const float array_exp[27] = {	
		1.0000,  1.1052,  1.2214,  1.3499,  1.4918,  1.6487,  1.8221,  2.0138,  2.2255, 
		2.4596,  2.7183,  3.0042,  3.3201,  3.6693,  4.0552,  4.4817,  4.9530,  5.4739, 
		6.0496,  6.6859,  7.3891,  8.1662,  9.0250,  9.9742, 11.0232, 12.1825, 13.4637};
	cout<<"testing exp --- ";
	Mat *a = getTestMatrix_3();
	Mat *res = NULL;
	safeGetPt(res, exp(a));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_exp, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

// edit zero-element in matrix
bool test_log(){
	const float array_log[27] = {	
		-2.3026, -2.3026, -1.6094, -1.2040, -0.9163, -0.6931, -0.5108, -0.3567, -0.2231, 
		-0.1054,  0.0000,  0.0953,  0.1823,  0.2624,  0.3365,  0.4055,  0.4700,  0.5306, 
		 0.5878,  0.6419,  0.6931,  0.7419,  0.7885,  0.8329,  0.8755,  0.9163,  0.9555};
	cout<<"testing log --- ";
	Mat *a = getTestMatrix_3();
	a -> set(0, 0, 0, 0.1);
	Mat *res = NULL;
	safeGetPt(res, log(a));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_log, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_pow(){
	const float array_pow[27] = {
			0.0000, 0.3162, 0.4472, 0.5477, 0.6325, 0.7071, 0.7746, 0.8367, 0.8944,
			0.9487, 1.0000, 1.0488, 1.0954, 1.1402, 1.1832, 1.2247, 1.2649, 1.3038,
			1.3416, 1.3784, 1.4142, 1.4491, 1.4832, 1.5166, 1.5492, 1.5811, 1.6125};
	cout<<"testing pow --- ";
	Mat *a = getTestMatrix_3();
	float b = getTestFloat();
	Mat *res = NULL;
	safeGetPt(res, pow(a, b));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_pow, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_square_m(){
	const float array_square_m[27] = {	
		0.0000, 0.0100, 0.0400, 0.0900, 0.1600, 0.2500, 0.3600, 0.4900, 0.6400, 
		0.8100, 1.0000, 1.2100, 1.4400, 1.6900, 1.9600, 2.2500, 2.5600, 2.8900, 
		3.2400, 3.6100, 4.0000, 4.4100, 4.8400, 5.2900, 5.7600, 6.2500, 6.7600};
	cout<<"testing square_m --- ";
	Mat *a = getTestMatrix_3();
	Mat *res = NULL;
	safeGetPt(res, square(a));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_square_m, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_square_v(){
	cout<<"testing square_v --- ";
	vector3f *a = getTestVector3f_0();
	vector3f *res = NULL;
	res = square(a);
	vector3f *expect = new vector3f(0.0625, 0.2500, 0.5625);
	bool result = areApproximatelyIdentical(res, expect);
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_sqrt_m(){
	const float array_sqrt_m[27] = {	
		0.0000, 0.3162, 0.4472, 0.5477, 0.6325, 0.7071, 0.7746, 0.8367, 0.8944, 
		0.9487, 1.0000, 1.0488, 1.0954, 1.1402, 1.1832, 1.2247, 1.2649, 1.3038, 
		1.3416, 1.3784, 1.4142, 1.4491, 1.4832, 1.5166, 1.5492, 1.5811, 1.6125};
	cout<<"testing sqrt_m --- ";
	Mat *a = getTestMatrix_3();
	Mat *res = NULL;
	safeGetPt(res, sqrt(a));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_sqrt_m, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_sqrt_v(){
	cout<<"testing sqrt_v --- ";
	vector3f *a = getTestVector3f_0();
	vector3f *res = NULL;
	res = sqrt(a);
	vector3f *expect = new vector3f(0.5000, 0.7071, 0.8660);
	bool result = areApproximatelyIdentical(res, expect);
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_sum_v(){
	cout<<"testing sum_v --- ";
	vector3f *a = getTestVector3f_0();
	float res = sum(a);
	float expect = 1.5;
	bool result = areApproximatelyIdentical(res, expect);
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_sum_m(){
	cout<<"testing sum_m --- ";
	Mat *a = getTestMatrix_3();
	vector3f *res = NULL;
	res = sum(a);
	vector3f *expect = new vector3f(3.6, 11.7, 19.8);
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_average(){
	cout<<"testing average --- ";
	Mat *a = getTestMatrix_3();
	vector3f *res = NULL;
	res = average(a);
	vector3f *expect = new vector3f(0.4, 1.3, 2.2);
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_stddev(){
	cout<<"testing standard deviation --- ";
	Mat *a = getTestMatrix_3();
	vector3f *res = NULL;
	vector3f *avg = new vector3f(0.4, 1.3, 2.2);
	res = stddev(a, avg);
	vector3f *expect = new vector3f(0.2582, 0.2582, 0.2582);
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_max_v(){
	cout<<"testing max_v --- ";
	vector3f *a = getTestVector3f_0();
	float res = max(a);
	float expect = 0.75;
	bool result = areApproximatelyIdentical(res, expect);
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_min_v(){
	cout<<"testing max_v --- ";
	vector3f *a = getTestVector3f_0();
	float res = min(a);
	float expect = 0.25;
	bool result = areApproximatelyIdentical(res, expect);
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_max_m(){
	cout<<"testing max_m --- ";
	Mat *a = getTestMatrix_3();
	vector3f *res = NULL;
	res = max(a);
	vector3f *expect = new vector3f(0.8, 1.7, 2.6);
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_min_m(){
	cout<<"testing min_m --- ";
	Mat *a = getTestMatrix_3();
	vector3f *res = NULL;
	res = min(a);
	vector3f *expect = new vector3f(0.0, 0.9, 1.8);
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_maxLoc(){
	cout<<"testing maxLoc --- ";
	Mat *a = getTestMatrix_3();
	vector3f *resVal = new vector3f();
	vector3f *resLoc = new vector3f();
	max(a, resVal, resLoc);
	vector3f *expectVal = new vector3f(0.8, 1.7, 2.6);
	vector3f *expectLoc = new vector3f(8, 8, 8);
	bool result = areApproximatelyIdentical(resVal, expectVal) && areApproximatelyIdentical(resLoc, expectLoc);
	a -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_minLoc(){
	cout<<"testing minLoc --- ";
	Mat *a = getTestMatrix_3();
	vector3f *resVal = new vector3f();
	vector3f *resLoc = new vector3f();
	min(a, resVal, resLoc);
	vector3f *expectVal = new vector3f(0.0, 0.9, 1.8);
	vector3f *expectLoc = new vector3f(0, 0, 0);
	bool result = areApproximatelyIdentical(resVal, expectVal) && areApproximatelyIdentical(resLoc, expectLoc);
	a -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_minMaxLoc(){
	cout<<"testing minLoc --- ";
	Mat *a = getTestMatrix_3();
	vector3f *resMinVal = new vector3f();
	vector3f *resMinLoc = new vector3f();
	vector3f *resMaxVal = new vector3f();
	vector3f *resMaxLoc = new vector3f();
	minMaxLoc(a, resMaxVal, resMaxLoc, resMinVal, resMinLoc);
	vector3f *expectMaxVal = new vector3f(0.8, 1.7, 2.6);
	vector3f *expectMaxLoc = new vector3f(8, 8, 8);
	vector3f *expectMinVal = new vector3f(0.0, 0.9, 1.8);
	vector3f *expectMinLoc = new vector3f(0, 0, 0);
	bool result = areApproximatelyIdentical(resMinVal, expectMinVal) &&
				  areApproximatelyIdentical(resMinLoc, expectMinLoc) &&
				  areApproximatelyIdentical(resMaxVal, expectMaxVal) &&
				  areApproximatelyIdentical(resMaxLoc, expectMaxLoc) ;
	a -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_greaterThan(){
	const float array_greaterThan[27] = {
			0, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 1, 1, 1, 1, 1, 1, 1, 1,
			1, 1, 1, 1, 1, 1, 1, 1, 1};
	cout<<"testing greaterThan --- ";
	Mat *a = getTestMatrix_3();
	float b = getTestFloat();
	Mat *res = NULL;
	safeGetPt(res, greaterThan(a, b));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_greaterThan, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_lessThan(){
	const float array_lessThan[27] = {
			1, 1, 1, 1, 1, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0};
	cout<<"testing lessThan --- ";
	Mat *a = getTestMatrix_3();
	float b = getTestFloat();
	Mat *res = NULL;
	safeGetPt(res, lessThan(a, b));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_lessThan, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_convert_vv(){
	cout<<"testing convert_vv --- ";
	const float array_convert_vv[162] = {
			0.0000, 0.1000, 0.2000, 0.3000, 0.4000, 0.5000, 0.6000, 0.7000, 0.8000,
			0.9000, 1.0000, 1.1000, 1.2000, 1.3000, 1.4000, 1.5000, 1.6000, 1.7000,
			1.8000, 1.9000, 2.0000, 2.1000, 2.2000, 2.3000, 2.4000, 2.5000, 2.6000,
			0.0000, 0.1000, 0.2000, 0.3000, 0.4000, 0.5000, 0.6000, 0.7000, 0.8000,
			0.9000, 1.0000, 1.1000, 1.2000, 1.3000, 1.4000, 1.5000, 1.6000, 1.7000,
			1.8000, 1.9000, 2.0000, 2.1000, 2.2000, 2.3000, 2.4000, 2.5000, 2.6000,
			0.0000, 0.1000, 0.2000, 0.3000, 0.4000, 0.5000, 0.6000, 0.7000, 0.8000,
			0.9000, 1.0000, 1.1000, 1.2000, 1.3000, 1.4000, 1.5000, 1.6000, 1.7000,
			1.8000, 1.9000, 2.0000, 2.1000, 2.2000, 2.3000, 2.4000, 2.5000, 2.6000,
			0.0000, 0.1000, 0.2000, 0.3000, 0.4000, 0.5000, 0.6000, 0.7000, 0.8000,
			0.9000, 1.0000, 1.1000, 1.2000, 1.3000, 1.4000, 1.5000, 1.6000, 1.7000,
			1.8000, 1.9000, 2.0000, 2.1000, 2.2000, 2.3000, 2.4000, 2.5000, 2.6000,
			0.0000, 0.1000, 0.2000, 0.3000, 0.4000, 0.5000, 0.6000, 0.7000, 0.8000,
			0.9000, 1.0000, 1.1000, 1.2000, 1.3000, 1.4000, 1.5000, 1.6000, 1.7000,
			1.8000, 1.9000, 2.0000, 2.1000, 2.2000, 2.3000, 2.4000, 2.5000, 2.6000,
			0.0000, 0.1000, 0.2000, 0.3000, 0.4000, 0.5000, 0.6000, 0.7000, 0.8000,
			0.9000, 1.0000, 1.1000, 1.2000, 1.3000, 1.4000, 1.5000, 1.6000, 1.7000,
			1.8000, 1.9000, 2.0000, 2.1000, 2.2000, 2.3000, 2.4000, 2.5000, 2.6000};
	std::vector<std::vector<Mat*> > vec;
	getTestVectorVectorMat(vec);
	Mat *res = new Mat();
	convert(vec, res);
	Mat *expect = new Mat(vec[0].size() * vec[0][0] -> getLength(), vec.size(), 1);
	memcpy(expect -> hostData, array_convert_vv, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	releaseVector(vec);
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_convert_m(){
	cout<<"testing convert_m --- ";
	const float array_convert_m[162] = {
			0.0000, 0.1000, 0.2000, 0.3000, 0.4000, 0.5000, 0.6000, 0.7000, 0.8000,
			0.9000, 1.0000, 1.1000, 1.2000, 1.3000, 1.4000, 1.5000, 1.6000, 1.7000,
			1.8000, 1.9000, 2.0000, 2.1000, 2.2000, 2.3000, 2.4000, 2.5000, 2.6000,
			0.0000, 0.1000, 0.2000, 0.3000, 0.4000, 0.5000, 0.6000, 0.7000, 0.8000,
			0.9000, 1.0000, 1.1000, 1.2000, 1.3000, 1.4000, 1.5000, 1.6000, 1.7000,
			1.8000, 1.9000, 2.0000, 2.1000, 2.2000, 2.3000, 2.4000, 2.5000, 2.6000,
			0.0000, 0.1000, 0.2000, 0.3000, 0.4000, 0.5000, 0.6000, 0.7000, 0.8000,
			0.9000, 1.0000, 1.1000, 1.2000, 1.3000, 1.4000, 1.5000, 1.6000, 1.7000,
			1.8000, 1.9000, 2.0000, 2.1000, 2.2000, 2.3000, 2.4000, 2.5000, 2.6000,
			0.0000, 0.1000, 0.2000, 0.3000, 0.4000, 0.5000, 0.6000, 0.7000, 0.8000,
			0.9000, 1.0000, 1.1000, 1.2000, 1.3000, 1.4000, 1.5000, 1.6000, 1.7000,
			1.8000, 1.9000, 2.0000, 2.1000, 2.2000, 2.3000, 2.4000, 2.5000, 2.6000,
			0.0000, 0.1000, 0.2000, 0.3000, 0.4000, 0.5000, 0.6000, 0.7000, 0.8000,
			0.9000, 1.0000, 1.1000, 1.2000, 1.3000, 1.4000, 1.5000, 1.6000, 1.7000,
			1.8000, 1.9000, 2.0000, 2.1000, 2.2000, 2.3000, 2.4000, 2.5000, 2.6000,
			0.0000, 0.1000, 0.2000, 0.3000, 0.4000, 0.5000, 0.6000, 0.7000, 0.8000,
			0.9000, 1.0000, 1.1000, 1.2000, 1.3000, 1.4000, 1.5000, 1.6000, 1.7000,
			1.8000, 1.9000, 2.0000, 2.1000, 2.2000, 2.3000, 2.4000, 2.5000, 2.6000};
	std::vector<std::vector<Mat*> > expect;
	std::vector<std::vector<Mat*> > res;
	getTestVectorVectorMat(expect);
	Mat *a = new Mat(2 * 27, 3, 1);
	memcpy(a -> hostData, array_convert_m, a -> getLength() * sizeof(float));
	a -> hostToDevice();
	convert(a, res, 3, 3);
	bool result = areApproximatelyIdentical(res, expect);
	releaseVector(res);
	releaseVector(expect);
	a -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_Tanh(){
	const float array_Tanh[27] = {
			0.0000, 0.0997, 0.1974, 0.2913, 0.3799, 0.4621, 0.5370, 0.6044, 0.6640,
			0.7163, 0.7616, 0.8005, 0.8337, 0.8617, 0.8854, 0.9051, 0.9217, 0.9354,
			0.9468, 0.9562, 0.9640, 0.9705, 0.9757, 0.9801, 0.9837, 0.9866, 0.9890};
	cout<<"testing Tanh --- ";
	Mat *a = getTestMatrix_3();
	Mat *res = NULL;
	safeGetPt(res, Tanh(a));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_Tanh, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_dTanh(){
	const float array_dTanh[27] = {
			 1.0000,  0.9900,  0.9600,  0.9100,  0.8400,  0.7500,  0.6400,  0.5100,  0.3600,
			 0.1900,  0.0000, -0.2100, -0.4400, -0.6900, -0.9600, -1.2500, -1.5600, -1.8900,
			-2.2400, -2.6100, -3.0000, -3.4100, -3.8400, -4.2900, -4.7600, -5.2500, -5.7600};
	cout<<"testing dtanh --- ";
	Mat *a = getTestMatrix_3();
	Mat *res = NULL;
	safeGetPt(res, dTanh(a));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_dTanh, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_sigmoid(){
	const float array_sigmoid[27] = {
			0.5000, 0.5250, 0.5498, 0.5744, 0.5987, 0.6225, 0.6457, 0.6682, 0.6900,
			0.7109, 0.7311, 0.7503, 0.7685, 0.7858, 0.8022, 0.8176, 0.8320, 0.8455,
			0.8581, 0.8699, 0.8808, 0.8909, 0.9002, 0.9089, 0.9168, 0.9241, 0.9309};
	cout<<"testing sigmoid --- ";
	Mat *a = getTestMatrix_3();
	Mat *res = NULL;
	safeGetPt(res, sigmoid(a));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_sigmoid, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_dsigmoid(){
	const float array_dsigmoid[27] = {
			0.2500, 0.2494, 0.2475, 0.2445, 0.2403, 0.2350, 0.2288, 0.2217, 0.2139,
			0.2055, 0.1966, 0.1874, 0.1779, 0.1683, 0.1587, 0.1491, 0.1398, 0.1306,
			0.1217, 0.1132, 0.1050, 0.0972, 0.0898, 0.0828, 0.0763, 0.0701, 0.0644};
	cout<<"testing dsigmoid --- ";
	Mat *a = getTestMatrix_3();
	Mat *res = NULL;
	safeGetPt(res, dsigmoid(a));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_dsigmoid, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_dsigmoid_a(){
	const float array_dsigmoid_a[27] = {
			 0.0000,  0.0900,  0.1600,  0.2100,  0.2400,  0.2500,  0.2400,  0.2100,  0.1600,
			 0.0900,  0.0000, -0.1100, -0.2400, -0.3900, -0.5600, -0.7500, -0.9600, -1.1900,
			-1.4400, -1.7100, -2.0000, -2.3100, -2.6400, -2.9900, -3.3600, -3.7500, -4.1600};
	cout<<"testing dsigmoid_a --- ";
	Mat *a = getTestMatrix_3();
	Mat *res = NULL;
	safeGetPt(res, dsigmoid_a(a));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_dsigmoid_a, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_ReLU(){
	const float array_ReLU[27] = {
			0.0000, 0.1000, 0.2000, 0.3000, 0.4000, 0.5000, 0.6000, 0.7000, 0.8000,
			0.9000, 1.0000, 1.1000, 1.2000, 1.3000, 1.4000, 1.5000, 1.6000, 1.7000,
			1.8000, 1.9000, 2.0000, 2.1000, 2.2000, 2.3000, 2.4000, 2.5000, 2.6000};
	cout<<"testing ReLU --- ";
	Mat *a = getTestMatrix_3();
	Mat *res = NULL;
	safeGetPt(res, ReLU(a));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_ReLU, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_dReLU(){
	const float array_dReLU[27] = {
			 0, 1, 1, 1, 1, 1, 1, 1, 1,
			 1, 1, 1, 1, 1, 1, 1, 1, 1,
			 1, 1, 1, 1, 1, 1, 1, 1, 1};
	cout<<"testing dReLU --- ";
	Mat *a = getTestMatrix_3();
	Mat *res = NULL;
	safeGetPt(res, dReLU(a));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_dReLU, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_LeakyReLU(){
	const float array_LeakyReLU[27] = {
			0.0000, 0.1000, 0.2000, 0.3000, 0.4000, 0.5000, 0.6000, 0.7000, 0.8000,
			0.9000, 1.0000, 1.1000, 1.2000, 1.3000, 1.4000, 1.5000, 1.6000, 1.7000,
			1.8000, 1.9000, 2.0000, 2.1000, 2.2000, 2.3000, 2.4000, 2.5000, 2.6000};
	cout<<"testing LeakyReLU --- ";
	Mat *a = getTestMatrix_3();
	Mat *res = NULL;
	safeGetPt(res, LeakyReLU(a));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_LeakyReLU, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_dLeakyReLU(){
	const float array_dLeakyReLU[27] = {
			 0, 1, 1, 1, 1, 1, 1, 1, 1,
			 1, 1, 1, 1, 1, 1, 1, 1, 1,
			 1, 1, 1, 1, 1, 1, 1, 1, 1};
	cout<<"testing dLeakyReLU --- ";
	Mat *a = getTestMatrix_3();
	Mat *res = NULL;
	safeGetPt(res, dLeakyReLU(a));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_dLeakyReLU, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_fliplr(){
	const float array_fliplr[27] = {
			0.2000, 0.1000, 0.0000,
			0.5000, 0.4000, 0.3000,
			0.8000, 0.7000, 0.6000,
			1.1000, 1.0000, 0.9000,
			1.4000, 1.3000, 1.2000,
			1.7000, 1.6000, 1.5000,
			2.0000, 1.9000, 1.8000,
			2.3000, 2.2000, 2.1000,
			2.6000, 2.5000, 2.4000};
	cout<<"testing fliplr --- ";
	Mat *a = getTestMatrix_3();
	Mat *res = NULL;
	safeGetPt(res, fliplr(a));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_fliplr, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_rot90(){
	const float array_rot90[27] = {
			0.8000, 0.7000, 0.6000, 0.5000, 0.4000, 0.3000, 0.2000, 0.1000, 0.0000,
			1.7000, 1.6000, 1.5000, 1.4000, 1.3000, 1.2000, 1.1000, 1.0000, 0.9000,
			2.6000, 2.5000, 2.4000, 2.3000, 2.2000, 2.1000, 2.0000, 1.9000, 1.8000};
	cout<<"testing rot90 --- ";
	Mat *a = getTestMatrix_3();
	Mat *res = NULL;
	safeGetPt(res, rot90(a, 2));
	Mat *expect = new Mat(a -> rows, a -> cols, a -> channels);
	memcpy(expect -> hostData, array_rot90, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_dopadding(){
	const float array_dopadding[75] = {
			0,0,0,0,0,0,0,0.1000,0.2000,0,0,0.3000,0.4000,0.5000,0,0,0.6000,0.7000,0.8000,0,0,0,0,0,0,
			0,0,0,0,0,0,0.9000,1.0000,1.1000,0,0,1.2000,1.3000,1.4000,0,0,1.5000,1.6000,1.7000,0,0,0,0,0,0,
			0,0,0,0,0,0,1.8000,1.9000,2.0000,0,0,2.1000,2.2000,2.3000,0,0,2.4000,2.5000,2.6000,0,0,0,0,0,0};
	cout<<"testing dopadding --- ";
	Mat *a = getTestMatrix_3();
	Mat *res = NULL;
	safeGetPt(res, dopadding(a, 1));
	Mat *expect = new Mat(a -> rows + 2, a -> cols + 2, a -> channels);
	memcpy(expect -> hostData, array_dopadding, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_depadding(){
	const float array_depadding[75] = {
			0.6000, 0.7000, 0.8000, 1.1000, 1.2000, 1.3000, 1.6000, 1.7000, 1.8000,
			3.1000, 3.2000, 3.3000, 3.6000, 3.7000, 3.8000, 4.1000, 4.2000, 4.3000,
			5.6000, 5.7000, 5.8000, 6.1000, 6.2000, 6.3000, 6.6000, 6.7000, 6.8000};
	cout<<"testing depadding --- ";
	Mat *a = getTestMatrix_5();
	Mat *res = NULL;
	safeGetPt(res, depadding(a, 1));
	Mat *expect = new Mat(a -> rows - 2, a -> cols - 2, a -> channels);
	memcpy(expect -> hostData, array_depadding, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_reduce(){
	const float array_reduce_row_sum[9] = {0.9, 1.2, 1.5, 3.6, 3.9, 4.2, 6.3, 6.6, 6.9};
	const float array_reduce_col_sum[9] = {0.3, 1.2, 2.1, 3.0, 3.9, 4.8, 5.7, 6.6, 7.5};
	const float array_reduce_row_max[9] = {0.6, 0.7, 0.8, 1.5, 1.6, 1.7, 2.4, 2.5, 2.6};
	const float array_reduce_col_max[9] = {0.2, 0.5, 0.8, 1.1, 1.4, 1.7, 2.0, 2.3, 2.6};
	cout<<"testing reduce --- ";
	Mat *a = getTestMatrix_3();
	Mat *res_row_sum = NULL;
	Mat *res_col_sum = NULL;
	Mat *res_row_max = NULL;
	Mat *res_col_max = NULL;
	safeGetPt(res_row_sum, reduce(a, REDUCE_TO_SINGLE_ROW, REDUCE_SUM));
	safeGetPt(res_col_sum, reduce(a, REDUCE_TO_SINGLE_COL, REDUCE_SUM));
	safeGetPt(res_row_max, reduce(a, REDUCE_TO_SINGLE_ROW, REDUCE_MAX));
	safeGetPt(res_col_max, reduce(a, REDUCE_TO_SINGLE_COL, REDUCE_MAX));
	Mat *expect_row_sum = new Mat(1, a -> cols, a -> channels);
	Mat *expect_col_sum = new Mat(a -> rows, 1, a -> channels);
	Mat *expect_row_max = new Mat(1, a -> cols, a -> channels);
	Mat *expect_col_max = new Mat(a -> rows, 1, a -> channels);
	memcpy(expect_row_sum -> hostData, array_reduce_row_sum, expect_row_sum -> getLength() * sizeof(float));
	memcpy(expect_col_sum -> hostData, array_reduce_col_sum, expect_col_sum -> getLength() * sizeof(float));
	memcpy(expect_row_max -> hostData, array_reduce_row_max, expect_row_max -> getLength() * sizeof(float));
	memcpy(expect_col_max -> hostData, array_reduce_col_max, expect_col_max -> getLength() * sizeof(float));
	expect_row_sum -> hostToDevice();
	expect_col_sum -> hostToDevice();
	expect_row_max -> hostToDevice();
	expect_col_max -> hostToDevice();
	bool result = 	areApproximatelyIdentical(res_row_sum, expect_row_sum) &&
					areApproximatelyIdentical(res_col_sum, expect_col_sum) &&
					areApproximatelyIdentical(res_row_max, expect_row_max) &&
					areApproximatelyIdentical(res_col_max, expect_col_max);
	a -> release();
    res_row_sum -> release();
    res_col_sum -> release();
    res_row_max -> release();
    res_col_max -> release();
    expect_row_sum -> release();
    expect_col_sum -> release();
    expect_row_max -> release();
    expect_col_max -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_getRange(){
	const float array_getRange[24] = {
			0.6, 0.7, 0.8, 0.9, 1.1, 1.2, 1.3, 1.4,
			3.1, 3.2, 3.3, 3.4, 3.6, 3.7, 3.8, 3.9,
			5.6, 5.7, 5.8, 5.9, 6.1, 6.2, 6.3, 6.4};
	cout<<"testing getRange --- ";
	Mat *a = getTestMatrix_5();
	Mat *res = NULL;
	safeGetPt(res, getRange(a, 1, 4, 1, 2));
	Mat *expect = new Mat(2, 4, a -> channels);
	memcpy(expect -> hostData, array_getRange, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_interpolation(){
	const float array_interpolation[75] = {
			0, 0, 0.1, 0, 0.2, 0, 0, 0, 0, 0, 0.3, 0, 0.4, 0, 0.5, 0, 0, 0, 0, 0, 0.6, 0, 0.7, 0, 0.8,
		  0.9, 0, 1.0, 0, 1.1, 0, 0, 0, 0, 0, 1.2, 0, 1.3, 0, 1.4, 0, 0, 0, 0, 0, 1.5, 0, 1.6, 0, 1.7,
		  1.8, 0, 1.9, 0, 2.0, 0, 0, 0, 0, 0, 2.1, 0, 2.2, 0, 2.3, 0, 0, 0, 0, 0, 2.4, 0, 2.5, 0, 2.6};
	cout<<"testing interpolation --- ";
	Mat *a = getTestMatrix_3();
	Mat *res = NULL;
	safeGetPt(res, interpolation(a, 5));
	Mat *expect = new Mat(5, 5, a -> channels);
	memcpy(expect -> hostData, array_interpolation, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_repmat(){
	const float array_repmat[162] = {
				0.0000, 0.1000, 0.2000, 0.0000, 0.1000, 0.2000, 0.0000, 0.1000, 0.2000,
				0.3000, 0.4000, 0.5000, 0.3000, 0.4000, 0.5000, 0.3000, 0.4000, 0.5000,
				0.6000, 0.7000, 0.8000, 0.6000, 0.7000, 0.8000, 0.6000, 0.7000, 0.8000,
				0.0000, 0.1000, 0.2000, 0.0000, 0.1000, 0.2000, 0.0000, 0.1000, 0.2000,
				0.3000, 0.4000, 0.5000, 0.3000, 0.4000, 0.5000, 0.3000, 0.4000, 0.5000,
				0.6000, 0.7000, 0.8000, 0.6000, 0.7000, 0.8000, 0.6000, 0.7000, 0.8000,
				0.9000, 1.0000, 1.1000, 0.9000, 1.0000, 1.1000, 0.9000, 1.0000, 1.1000,
				1.2000, 1.3000, 1.4000, 1.2000, 1.3000, 1.4000, 1.2000, 1.3000, 1.4000,
				1.5000, 1.6000, 1.7000, 1.5000, 1.6000, 1.7000, 1.5000, 1.6000, 1.7000,
				0.9000, 1.0000, 1.1000, 0.9000, 1.0000, 1.1000, 0.9000, 1.0000, 1.1000,
				1.2000, 1.3000, 1.4000, 1.2000, 1.3000, 1.4000, 1.2000, 1.3000, 1.4000,
				1.5000, 1.6000, 1.7000, 1.5000, 1.6000, 1.7000, 1.5000, 1.6000, 1.7000,
				1.8000, 1.9000, 2.0000, 1.8000, 1.9000, 2.0000, 1.8000, 1.9000, 2.0000,
				2.1000, 2.2000, 2.3000, 2.1000, 2.2000, 2.3000, 2.1000, 2.2000, 2.3000,
				2.4000, 2.5000, 2.6000, 2.4000, 2.5000, 2.6000, 2.4000, 2.5000, 2.6000,
				1.8000, 1.9000, 2.0000, 1.8000, 1.9000, 2.0000, 1.8000, 1.9000, 2.0000,
				2.1000, 2.2000, 2.3000, 2.1000, 2.2000, 2.3000, 2.1000, 2.2000, 2.3000,
				2.4000, 2.5000, 2.6000, 2.4000, 2.5000, 2.6000, 2.4000, 2.5000, 2.6000};
	cout<<"testing repmat --- ";
	Mat *a = getTestMatrix_3();
	Mat *res = NULL;
	safeGetPt(res, repmat(a, 2, 3));
	Mat *expect = new Mat(6, 9, a -> channels);
	memcpy(expect -> hostData, array_repmat, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_downSample(){
	const float array_downsample[27] = {
			0.0, 0.2, 0.4, 1.0, 1.2, 1.4, 2.0, 2.2, 2.4,
			2.5, 2.7, 2.9, 3.5, 3.7, 3.9, 4.5, 4.7, 4.9,
			5.0, 5.2, 5.4, 6.0, 6.2, 6.4, 7.0, 7.2, 7.4};
	cout<<"testing downsample --- ";
	Mat *a = getTestMatrix_5();
	Mat *res = NULL;
	safeGetPt(res, downSample(a, 2, 2));
	Mat *expect = new Mat(3, 3, a -> channels);
	memcpy(expect -> hostData, array_downsample, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_copyMakeBorder(){
	const float array_copyMakeBorder[180] = {
			0.2500, 0.2500, 0.2500, 0.2500, 0.2500, 0.2500, 0.2500, 0.2500, 0.2500, 0.2500,
			0.2500, 0.2500, 0.2500, 0.0000, 0.1000, 0.2000, 0.2500, 0.2500, 0.2500, 0.2500,
			0.2500, 0.2500, 0.2500, 0.3000, 0.4000, 0.5000, 0.2500, 0.2500, 0.2500, 0.2500,
			0.2500, 0.2500, 0.2500, 0.6000, 0.7000, 0.8000, 0.2500, 0.2500, 0.2500, 0.2500,
			0.2500, 0.2500, 0.2500, 0.2500, 0.2500, 0.2500, 0.2500, 0.2500, 0.2500, 0.2500,
			0.2500, 0.2500, 0.2500, 0.2500, 0.2500, 0.2500, 0.2500, 0.2500, 0.2500, 0.2500,
			0.5000, 0.5000, 0.5000, 0.5000, 0.5000, 0.5000, 0.5000, 0.5000, 0.5000, 0.5000,
			0.5000, 0.5000, 0.5000, 0.9000, 1.0000, 1.1000, 0.5000, 0.5000, 0.5000, 0.5000,
			0.5000, 0.5000, 0.5000, 1.2000, 1.3000, 1.4000, 0.5000, 0.5000, 0.5000, 0.5000,
			0.5000, 0.5000, 0.5000, 1.5000, 1.6000, 1.7000, 0.5000, 0.5000, 0.5000, 0.5000,
			0.5000, 0.5000, 0.5000, 0.5000, 0.5000, 0.5000, 0.5000, 0.5000, 0.5000, 0.5000,
			0.5000, 0.5000, 0.5000, 0.5000, 0.5000, 0.5000, 0.5000, 0.5000, 0.5000, 0.5000,
			0.7500, 0.7500, 0.7500, 0.7500, 0.7500, 0.7500, 0.7500, 0.7500, 0.7500, 0.7500,
			0.7500, 0.7500, 0.7500, 1.8000, 1.9000, 2.0000, 0.7500, 0.7500, 0.7500, 0.7500,
			0.7500, 0.7500, 0.7500, 2.1000, 2.2000, 2.3000, 0.7500, 0.7500, 0.7500, 0.7500,
			0.7500, 0.7500, 0.7500, 2.4000, 2.5000, 2.6000, 0.7500, 0.7500, 0.7500, 0.7500,
			0.7500, 0.7500, 0.7500, 0.7500, 0.7500, 0.7500, 0.7500, 0.7500, 0.7500, 0.7500,
			0.7500, 0.7500, 0.7500, 0.7500, 0.7500, 0.7500, 0.7500, 0.7500, 0.7500, 0.7500};
	cout<<"testing copyMakeBorder --- ";
	Mat *a = getTestMatrix_3();
	Mat *res = NULL;
	vector3f *v = getTestVector3f_0();
	safeGetPt(res, copyMakeBorder(a, 1, 2, 3, 4, v));
	Mat *expect = new Mat(6, 10, a -> channels);
	memcpy(expect -> hostData, array_copyMakeBorder, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_kron(){
	const float array_kron[108] = {
			 0.0000,  0.0000,  0.1000,  0.2000,  0.2000,  0.4000,
			 0.0000,  0.0000,  0.3000,  0.4000,  0.6000,  0.8000,
			 0.3000,  0.6000,  0.4000,  0.8000,  0.5000,  1.0000,
			 0.9000,  1.2000,  1.2000,  1.6000,  1.5000,  2.0000,
			 0.6000,  1.2000,  0.7000,  1.4000,  0.8000,  1.6000,
			 1.8000,  2.4000,  2.1000,  2.8000,  2.4000,  3.2000,
			 0.9000,  1.8000,  1.0000,  2.0000,  1.1000,  2.2000,
			 2.7000,  3.6000,  3.0000,  4.0000,  3.3000,  4.4000,
			 1.2000,  2.4000,  1.3000,  2.6000,  1.4000,  2.8000,
			 3.6000,  4.8000,  3.9000,  5.2000,  4.2000,  5.6000,
			 1.5000,  3.0000,  1.6000,  3.2000,  1.7000,  3.4000,
			 4.5000,  6.0000,  4.8000,  6.4000,  5.1000,  6.8000,
			 1.8000,  3.6000,  1.9000,  3.8000,  2.0000,  4.0000,
			 5.4000,  7.2000,  5.7000,  7.6000,  6.0000,  8.0000,
			 2.1000,  4.2000,  2.2000,  4.4000,  2.3000,  4.6000,
			 6.3000,  8.4000,  6.6000,  8.8000,  6.9000,  9.2000,
			 2.4000,  4.8000,  2.5000,  5.0000,  2.6000,  5.2000,
			 7.2000,  9.6000,  7.5000, 10.0000,  7.8000, 10.4000};
	cout<<"testing kron --- ";
	Mat *a = getTestMatrix_3();
	Mat *b =new Mat(2, 2, 1);
	b -> set(0, 0, 0, 1.0);
	b -> set(0, 1, 0, 2.0);
	b -> set(1, 0, 0, 3.0);
	b -> set(1, 1, 0, 4.0);
	Mat *res = NULL;
	safeGetPt(res, kron(a, b));
	Mat *expect = new Mat(6, 6, a -> channels);
	memcpy(expect -> hostData, array_kron, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	b -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_conv2_kernel(){
	const float array_conv2_kernel[75] = {
			0.24, 0.45, 0.81, 1.17, 1.44,
			0.99, 1.2, 1.56, 1.92, 2.19,
			2.79, 3, 3.36, 3.72, 3.99,
			4.59, 4.8, 5.16, 5.52, 5.79,
			6.24, 6.45, 6.81, 7.17, 7.44,
			31.11, 31.86, 33.03, 34.2, 35.01,
			34.56, 35.31, 36.48, 37.65, 38.46,
			40.41, 41.16, 42.33, 43.5, 44.31,
			46.26, 47.01, 48.18, 49.35, 50.16,
			50.61, 51.36, 52.53, 53.7, 54.51,
			102.48, 103.77, 105.75, 107.73, 109.08,
			108.63, 109.92, 111.9, 113.88, 115.23,
			118.53, 119.82, 121.8, 123.78, 125.13,
			128.43, 129.72, 131.7, 133.68, 135.03,
			135.48, 136.77, 138.75, 140.73, 142.08};
	cout<<"testing conv_kernel --- ";
	Mat *a = getTestMatrix_5();
	Mat *b = getTestMatrix_3();
	Mat *res = NULL;
	safeGetPt(res, conv2(a, b));
	Mat *expect = new Mat(5, 5, a -> channels);
	memcpy(expect -> hostData, array_conv2_kernel, expect -> getLength() * sizeof(float));
	expect -> hostToDevice();
	bool result = areApproximatelyIdentical(res, expect);
	a -> release();
	b -> release();
	res -> release();
	expect -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}

bool test_conv2(){

	const float array_conv2_valid[27] = {
			0.0800,    0.4100,    0.5600,
		    1.5900,    3.3600,    3.0300,
		    3.4400,    6.1700,    4.8800,
		   12.1600,   20.0900,   14.7200,
		   26.0100,   42.3300,   30.5700,
		   23.9200,   38.4500,   27.4400,
		   42.2400,   66.7700,   46.8800,
		   77.4300,  121.8000,   85.1100,
		   62.4000,   97.7300,   68.0000};
	const float array_conv2_same[48] = {
		    0.0000,    0.0100,    0.0700,    0.0800,
		    0.1500,    1.2000,    1.9200,    1.0500,
		    1.0500,    4.8000,    5.5200,    2.5500,
		    1.2000,    4.3900,    4.8100,    1.9200,
		    2.2500,    7.7800,    8.3800,    3.1900,
		   10.5000,   35.3100,   37.6500,   13.9800,
		   14.1000,   47.0100,   49.3500,   18.1800,
		    6.7500,   22.0600,   23.0200,    8.3300,
		    9.0000,   29.0500,   30.1900,   10.8000,
		   34.3500,  109.9200,  113.8800,   40.4100,
		   40.6500,  129.7200,  133.6800,   47.3100,
		   16.8000,   53.2300,   54.7300,   19.2400};
	const float array_conv2_full[75] = {
			 0,         0,         0,         0,         0,
	         0,    0.0800,    0.4100,    0.5600,         0,
	         0,    1.5900,    3.3600,    3.0300,         0,
	         0,    3.4400,    6.1700,    4.8800,         0,
	         0,         0,         0,         0,         0,
	         0,         0,         0,         0,         0,
	         0,   12.1600,   20.0900,   14.7200,         0,
	         0,   26.0100,   42.3300,   30.5700,         0,
	         0,   23.9200,   38.4500,   27.4400,         0,
	         0,         0,         0,         0,         0,
	         0,         0,         0,         0,         0,
	         0,   42.2400,   66.7700,   46.8800,         0,
	         0,   77.4300,  121.8000,   85.1100,         0,
	         0,   62.4000,   97.7300,   68.0000,         0,
	         0,         0,         0,         0,         0};
	cout<<"testing conv --- ";
	Mat *a = getTestMatrix_5();
	Mat *b = getTestMatrix_3();
	Mat *res_valid = NULL;
	Mat *res_same = NULL;
	Mat *res_full = NULL;
	safeGetPt(res_valid, conv2(a, b, CONV_VALID, 1, 2));
	safeGetPt(res_same, conv2(a, b, CONV_SAME, 1, 2));
	safeGetPt(res_full, conv2(a, b, CONV_FULL, 1, 2));
	Mat *expect_valid = new Mat(3, 3, a -> channels);
	Mat *expect_same = new Mat(4, 4, a -> channels);
	Mat *expect_full = new Mat(5, 5, a -> channels);
	memcpy(expect_valid -> hostData, array_conv2_valid, expect_valid -> getLength() * sizeof(float));
	memcpy(expect_same -> hostData, array_conv2_same, expect_same -> getLength() * sizeof(float));
	memcpy(expect_full -> hostData, array_conv2_full, expect_full -> getLength() * sizeof(float));
	expect_valid -> hostToDevice();
	expect_same -> hostToDevice();
	expect_full -> hostToDevice();
	bool result = 	areApproximatelyIdentical(res_valid, expect_valid) &&
					areApproximatelyIdentical(res_same, expect_same) &&
					areApproximatelyIdentical(res_full, expect_full);
	a -> release();
	b -> release();
	res_valid -> release();
	res_same -> release();
	res_full -> release();
	expect_valid -> release();
	res_same -> release();
	res_full -> release();
	cout<<(result ? "success" : "failed")<<endl;
	return result;
}




/*

bool test_conv2();
bool test_pooling_with_overlap();
bool test_unpooling_with_overlap();
bool test_pooling();
bool test_unpooling();
 */