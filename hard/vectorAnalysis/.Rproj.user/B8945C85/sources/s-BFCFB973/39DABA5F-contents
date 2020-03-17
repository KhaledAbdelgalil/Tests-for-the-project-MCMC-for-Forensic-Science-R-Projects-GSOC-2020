#include<RcppArmadillo.h>
#include<algorithm>
#include<math.h>
// [[Rcpp::depends(RcppArmadillo)]]
using namespace Rcpp ;

// [[Rcpp::export()]]
double min_in_vector(Rcpp::NumericVector input){
  Rcpp::NumericVector temp(input.begin(),input.end());
  std::sort(temp.begin(),temp.end());
  return temp[0];
}

// [[Rcpp::export()]]
double max_in_vector(Rcpp::NumericVector input){
  Rcpp::NumericVector temp(input.begin(),input.end());
  std::sort(temp.begin(),temp.end());
  return temp[input.size()-1];
}


  // [[Rcpp::export()]]
Rcpp::NumericVector get_outliers_vector(Rcpp::NumericVector data){
    Rcpp::NumericVector temp(data.begin(),data.end());
    std::sort(temp.begin(),temp.end());
    Rcpp::NumericVector outliers;
    double Q1,Q3;
    double compare1,compare2;
    long long mid;
    mid=data.size()/2;
    if(data.size()%2==0)
    {
      //get compare1
      Q1=(temp[mid/2]);
      //get compare2
      Q3=(temp[mid+mid/2]);
    }
    else
    {
      if(mid%2==0)
      {
        Q1=(temp[mid/2]+temp[(mid/2)-1])/2.0;
        Q3=(temp[mid+mid/2]+temp[mid+(mid/2)+1])/2.0;
      }
      else
      {
          Q1=-1.5*(temp[mid/2]);
          Q3=1.5*(temp[mid+mid/2+1]);
      }
    }
    //std::cout<<Q1<<std::endl<<Q3;

    compare1=Q1-1.5*(Q3-Q1);
    compare2=Q3+1.5*(Q3-Q1);
    //std::cout<<compare1<<std::endl<<compare2;
    for(long long i=0;i<data.size();i++)
      if(data[i]<compare1||data[i]>compare2)outliers.push_back(data[i]);

      return outliers;
  }




// [[Rcpp::export()]]
Rcpp::NumericVector remove_outliers_vector(Rcpp::NumericVector data){
  Rcpp::NumericVector temp(data.begin(),data.end());
  std::sort(temp.begin(),temp.end());
  Rcpp::NumericVector NoOutliers;
  double compare1,compare2;
  long long mid;
  mid=data.size()/2;
  if(data.size()%2==0)
  {
    //get compare1
    compare1=-1.5*(temp[mid/2]);
    //get compare2
    compare2=1.5*(temp[mid+mid/2]);
  }
  else
  {
    if(mid%2==0)
    {
      compare1=-1.5*(temp[mid/2]+temp[(mid/2)-1]);
      compare2=1.5*(temp[mid+mid/2]+temp[mid+(mid/2)+1]);
    }
    else
    {
      compare1=-1.5*(temp[mid/2]);
      compare2=1.5*(temp[mid+mid/2+1]);
    }
  }
  for(long long i=0;i<data.size();i++)
    if(data[i]<compare1||data[i]>compare2);
    else NoOutliers.push_back(data[i]);

    return NoOutliers;
}

// [[Rcpp::export()]]
Rcpp::NumericVector min_max_normalize(Rcpp::NumericVector data,Rcpp::NumericVector newMin_newMax){
double oldMin=min_in_vector(data);
double oldMax=max_in_vector(data);
double newMin=newMin_newMax[0];
double newMax=newMin_newMax[1];
double exp1=oldMax-oldMin;
double exp2=newMax-newMin;

for(long long i=0;i<data.size();i++){
  data[i]=(data[i]-oldMin)/(exp1);
  data[i]*=exp2;
  data[i]+=newMin;
}
return data;
}

// [[Rcpp::export()]]
Rcpp::NumericVector z_score_normalize(Rcpp::NumericVector data){
  double mean=0,sigma=0;
  for(long long i=0;i<data.size();i++)
    mean+=data[i];
  mean/=(double)data.size();
  for(long long i=0;i<data.size();i++)
    sigma+=pow(data[i]-mean,2.0);
  sigma/=(data.size()-1);
  sigma=sqrt(sigma);

  for(long long i=0;i<data.size();i++)
    data[i]=(data[i]-mean)/sigma;

    return data;
  }



// [[Rcpp::export()]]
Rcpp::NumericVector decimal_normalize(Rcpp::NumericVector data){
  long long max_in_data_integer_part=(long long)(max_in_vector(data));
  long long digits=0;
 while(max_in_data_integer_part)
 {
   max_in_data_integer_part/=10;
   digits+=1;
 }
 //std::cout<<digits;
  double divide=pow(10.0,digits);
  for(int i=0;i<data.size();i++)
  {
    data[i]/=divide;
  }
  return data;
}
