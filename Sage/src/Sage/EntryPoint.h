#pragma once

#ifdef SAGE_PLATFORM_WINDOWS

extern Sage::Application* Sage::CreateApplication();

int main(int argc, char** argv)
{	
	printf("Sage Engine\n");

	auto app = Sage::CreateApplication();
	app->Run();
	delete app;
}

#endif