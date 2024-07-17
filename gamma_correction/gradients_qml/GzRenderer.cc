/*
 * Copyright (C) 2021 Rhys Mainwaring
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

// The functions BuildScene and createCamera are copied from the simple_demo
// example.

#include "GzRenderer.hh"

#include <QOpenGLContext>
#include <QQuickWindow>

#include <gz/common/Console.hh>

#include <iostream>

#include "example_config.hh"

using namespace gz;
using namespace rendering;

const std::string RESOURCE_PATH =
    common::joinPaths(std::string(PROJECT_BINARY_PATH), "media");

//////////////////////////////////////////////////
void BuildScene(gz::rendering::ScenePtr _scene)
{
  // initialize _scene
  _scene->SetAmbientLight(0.1, 0.1, 0.1);
  VisualPtr root = _scene->RootVisual();

  // create directional light
  DirectionalLightPtr light0 = _scene->CreateDirectionalLight();
  light0->SetDirection(0.0, 0.0, -1);
  light0->SetDiffuseColor(1.0, 1.0, 1.0);
  light0->SetSpecularColor(0.0, 0.0, 0.0);
  root->AddChild(light0);

  // create plane material
  MaterialPtr gradientMat = _scene->CreateMaterial();
  gradientMat->SetTexture(common::joinPaths(RESOURCE_PATH, "gradients.png"));

  // create plane visual
  VisualPtr plane = _scene->CreateVisual();
  plane->AddGeometry(_scene->CreatePlane());
  plane->SetLocalScale(5, 5, 1);
  plane->SetLocalRotation(GZ_PI / 4, 0.0, - GZ_PI / 2); 
  plane->SetLocalPosition(2.5, 0, -2.5);
  plane->SetMaterial(gradientMat);
  root->AddChild(plane);

  // create camera
  CameraPtr camera = _scene->CreateCamera("camera");
  camera->SetLocalPosition(0.0, 0.0, 0.0);
  camera->SetLocalRotation(0.0, 0.0, 0.0);
  camera->SetImageWidth(800);
  camera->SetImageHeight(800);
  camera->SetAntiAliasing(2);
  camera->SetAspectRatio(1.333);
  camera->SetHFOV(GZ_PI / 2);
  root->AddChild(camera);

  // track target
  camera->SetTrackTarget(plane);
}

//////////////////////////////////////////////////
gz::rendering::CameraPtr CreateCamera(const std::string &_engineName)
{
  // create and populate scene
  std::map<std::string, std::string> params;

  // ensure that the QML application and Gazebo / Ogre2 share an OpenGL
  // context
  params["useCurrentGLContext"] = "1";
  RenderEngine *engine = rendering::engine(_engineName, params);
  if (!engine)
  {
    std::cout << "Engine '" << _engineName
                << "' is not supported" << std::endl;
    return CameraPtr();
  }
  ScenePtr scene = engine->CreateScene("scene");
  BuildScene(scene);

  // return camera sensor
  SensorPtr sensor = scene->SensorByName("camera");
  return std::dynamic_pointer_cast<Camera>(sensor);
}

//////////////////////////////////////////////////
GzRenderer::~GzRenderer()
{
}

//////////////////////////////////////////////////
GzRenderer::GzRenderer()
{
}

//////////////////////////////////////////////////
void GzRenderer::Initialise()
{
  // no-op - all initialised on the main thread
}

//////////////////////////////////////////////////
void GzRenderer::InitialiseOnMainThread()
{
  if (!this->initialised)
  {
    this->InitEngine();
    this->initialised = true;
  }
}

//////////////////////////////////////////////////
void GzRenderer::Render()
{
  // pre-render may regenerate textureId if the size changes
  this->camera->PreRender();
  this->textureId = this->camera->RenderTextureGLId();

  // render to texture
  this->camera->Update();

  // Move camera
  // this->UpdateCamera();
}

//////////////////////////////////////////////////
bool GzRenderer::Initialised() const
{
  return this->initialised;
}

//////////////////////////////////////////////////
unsigned int GzRenderer::TextureId() const
{
  return this->textureId;
}

//////////////////////////////////////////////////
QSize GzRenderer::TextureSize() const
{
  return this->textureSize;
}

//////////////////////////////////////////////////
void GzRenderer::InitEngine()
{
  std::string engineName("ogre2");

  common::Console::SetVerbosity(4);

  try
  {
    this->camera = CreateCamera(engineName);
  }
  catch (...)
  {
    std::cerr << "Error starting up: " << engineName << std::endl;
  }

  if (!this->camera)
  {
    gzerr << "No cameras found. Scene will not be rendered" << std::endl;
    return;
  }

  // quick check on sizing...
  gzmsg << "imageW: " << this->camera->ImageWidth() << "\n";
  gzmsg << "imageH: " << this->camera->ImageHeight() << "\n";

  // pre-render will force texture creation and may update texture id
  this->camera->PreRender();
  this->textureId = this->camera->RenderTextureGLId();
}

//////////////////////////////////////////////////
void GzRenderer::UpdateCamera()
{
  double angle = this->cameraOffset / 2 * M_PI;
  double x = sin(angle) * 3.0 + 3.0;
  double y = cos(angle) * 3.0;
  this->camera->SetLocalPosition(x, y, 0.0);

  this->cameraOffset += 0.05;
}
