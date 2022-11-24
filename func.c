double Task(double x)
{
    double ans = 3.141592/2 - (x + (x*x*x)/(6) + (3*x*x*x*x*x)/(40));
    return ans;
}
