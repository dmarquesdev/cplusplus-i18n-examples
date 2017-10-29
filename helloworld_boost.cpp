#include <boost/locale.hpp>
#include <iostream>

#include <ctime>

int main(int argc, char *argv[]) {
    using namespace boost::locale;
    using namespace std;
    generator gen;
    gen.add_messages_path(".");
    gen.add_messages_domain("helloworld");
    locale loc=gen(argv[1]); 

    locale::global(loc); 
    
    cout.imbue(loc);
    
    cout<<"O código do local atual é: "<< std::use_facet<boost::locale::info>(loc).name() <<endl;
    cout<<"Os números tem o seguinte formato neste local: "<<as::number << 2527.12 <<endl;
    cout<<"A moeda tem o seguinte formato neste local: "<<as::currency << 1103.34 <<endl; 
    cout<<"As datas tem o seguinte formato neste local: "<<as::date << std::time(0) <<endl;
    cout<<"O horário tem o seguinte formato neste local: "<<as::time << std::time(0) <<endl;
    cout<<"É assim que dizemos 'Hello World!' neste local: "<<translate("Hello World!")<<endl;
    cout<<"\n"<<endl;
   
}