#pragma once

#ifdef SAGE_PLATFORM_WINDOWS

extern Sage::Application* Sage::CreateApplication();

int main(int argc, char** argv)
{	
	Sage::Log::Init();
	/*Sage::Log::GetCoreLogger()->warn("Initialized Log");
	Sage::Log::GetClientLogger()->info("Hello");*/
	SAGE_CORE_WARN("Initialized Log");
	int a = 5;
	SAGE_INFO("Hello, Var = {0}", a);

	auto app = Sage::CreateApplication();
	app->Run();
	delete app;
}

#endif